import 'package:bloc_demo/blocs/app_events.dart';
import 'package:bloc_demo/blocs/app_states.dart';
import 'package:bloc_demo/model/token.dart';
import 'package:bloc_demo/repo/repositories.dart';
import 'package:bloc_demo/util/shared_preferences_util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;

  UserBloc()
      : _userRepository = UserRepository(),
        super(UserLoadingState());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is LoginFetchEvent) {
      yield LoginFetchingState();
      /*  Token token = await loginWebClient.autenticar(
          usuario: event.usuario,
          senha: event.senha,
        );
 */
      /* if (token == null) {
          yield LoginEmptyState();
        } else { */
      //SharedPreferencesUtil.salvarToken(token);
      yield LoginFetchedState(
          token: Token(
              accessToken: "token", refreshToken: "refresh", nome: "Teste"));
      //}
    }

    if (event is LoadUserEvent) {
      emit(UserLoadingState());
      try {
        final users = await _userRepository.getUsers();
        emit(UserLoadedState(users));
      } catch (e) {
        emit(UserErrorState(e.toString()));
      }
    }
  }
}
