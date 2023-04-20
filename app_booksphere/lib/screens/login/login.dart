import 'package:bloc_demo/blocs/app_blocs.dart';
import 'package:bloc_demo/blocs/app_events.dart';
import 'package:bloc_demo/blocs/app_states.dart';
import 'package:bloc_demo/components/scaffold_base_body.dart';
import 'package:bloc_demo/core/app_assets.dart';
import 'package:bloc_demo/core/app_colors.dart';
import 'package:bloc_demo/core/app_styles.dart';
import 'package:bloc_demo/core/app_text_styles.dart';
import 'package:bloc_demo/extensoes/state_extensao.dart';
import 'package:bloc_demo/model/token.dart';
import 'package:bloc_demo/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserBloc(),
      child: PaginaLogin(),
    );
  }
}

class PaginaLogin extends StatefulWidget {
  @override
  _PaginaLoginState createState() => _PaginaLoginState();
}

class _PaginaLoginState extends State<PaginaLogin> {
  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  late FocusScopeNode node;

  final _keyFormulario = GlobalKey<FormState>();

  bool _carregando = false;

  void alterarCarregando(UserState state) {
    setState(() {
      _carregando = state is LoginFetchingState;
    });
  }

  @override
  Widget build(BuildContext context) {
    node = FocusScope.of(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: ScaffoldBaseBody(
          contexto: context,
          mostrarPlanoFundo: false,
          corPlanoFundo: Color.fromARGB(255, 227, 237, 245),
          carregando: _carregando,
          tela: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: _construirTela(),
          ),
        ));
  }

  BlocListener _construirTela() {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        alterarCarregando(state);
        if (state is LoginErrorState) {
          mostrarDialogoErro(
            exception: state.exception,
            reload: () {},
          );
        }
        if (state is LoginFetchedState) {
          _goToHome(state.token);
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _construirLogo(),
            _construirCorpo(),
            Container(),
          ],
        ),
      ),
    );
  }

  Widget _construirLogo() {
    return Column(
      children: [
        const SizedBox(height: 5),
        Icon(Icons.local_library, size: 80, color: Colors.blue.shade900),
        const SizedBox(height: 10),
        Text(
          "Booksphere",
          style: TextStyle(
            fontSize: 30,
            color: Colors.blue.shade900,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  Form _construirCorpo() {
    return Form(
      key: _keyFormulario,
      child: Column(
        children: [
          _construirInputUsuario(),
          const SizedBox(height: 20),
          _construirInputSenha(),
          const SizedBox(height: 20),
          _construirBotaoLogin(),
          const SizedBox(height: 5),
          _construirRecuperarSenha(),
          const SizedBox(height: 100),
          _construirCriarConta(),
        ],
      ),
    );
  }

  TextFormField _construirInputUsuario() {
    return TextFormField(
      controller: _usuarioController,
      onEditingComplete: () => node.nextFocus(),
      decoration: InputDecoration(
        labelText: "E-mail",
        filled: true,
        fillColor: Colors.white,
        hoverColor: Colors.white,
        focusColor: Colors.white,
        hintText: "E-mail",
        errorStyle: const TextStyle(fontStyle: FontStyle.italic, height: 0.5),
        hintStyle: AppTextStyles.textStyleHint,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        border: const OutlineInputBorder(),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue.shade900,
            width: 1.0,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.lightGray,
          ),
        ),
      ),
      inputFormatters: [
        FilteringTextInputFormatter.allow((RegExp("[a-zA-Z0-9]")))
      ],
      validator: (String? usuario) {
        if (usuario!.isEmpty) {
          return AppLocalizations.of(context)!.mensagemErroUsuarioVazio;
        }
        return null;
      },
    );
  }

  TextFormField _construirInputSenha() {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      controller: _senhaController,
      decoration: InputDecoration(
        labelText: "Senha",
        filled: true,
        fillColor: Colors.white,
        hoverColor: Colors.white,
        focusColor: Colors.white,
        hintText: "********",
        errorStyle: const TextStyle(fontStyle: FontStyle.italic, height: 0.5),
        hintStyle: AppTextStyles.textStyleHint,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        border: const OutlineInputBorder(),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue.shade900,
            width: 1.0,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.lightGray,
          ),
        ),
      ),
      obscureText: true,
      onEditingComplete: () =>
          {node.unfocus(), !_carregando ? _conectar() : null},
      validator: (String? senha) {
        if (senha!.isEmpty) {
          return AppLocalizations.of(context)!.mensagemErroSenhaVazia;
        }
        return null;
      },
    );
  }

  Align _construirRecuperarSenha() {
    return const Align(
        alignment: Alignment.centerRight,
        child: Text(
          "Esqueci a senha",
          style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
              decoration: TextDecoration.underline),
        ));
  }

  Padding _construirBotaoLogin() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox(
        width: 400,
        height: 50,
        child: ElevatedButton(
          onPressed: _conectar,
          style: AppStyles.elevatedButton,
          child: const Text("Login",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
    );
  }

  void _conectar() {
    node.unfocus();
    if (_keyFormulario.currentState!.validate()) {
      context.read<UserBloc>().add(
            LoginFetchEvent(
              usuario: _usuarioController.text,
              senha: _senhaController.text,
            ),
          );
    }
  }

  Align _construirCriarConta() {
    return const Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          "Criar Conta",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ));
  }

  void _goToHome(Token token) {
    Navigator.pushReplacementNamed(context, RotaHome, arguments: token);
  }
}
