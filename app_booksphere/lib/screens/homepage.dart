import 'package:bloc_demo/blocs/app_blocs.dart';
import 'package:bloc_demo/blocs/app_events.dart';
import 'package:bloc_demo/blocs/app_states.dart';
import 'package:bloc_demo/model/lista.dart';
import 'package:bloc_demo/model/livro.dart';
import 'package:bloc_demo/model/user_model.dart';
import 'package:bloc_demo/util/shared_preferences_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePageContainer extends StatefulWidget {
  @override
  _HomePageContainerPage createState() => _HomePageContainerPage();
}

class _HomePageContainerPage extends State<HomePageContainer>
    with TickerProviderStateMixin {
  late TabController tabController;
  late TabController tabControllerBottom;
  late List<ListaLivros> listaLivrosInicial = [];

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    tabControllerBottom = TabController(length: 4, vsync: this);
    /* SharedPreferencesUtil.recuperarLista()
        .then((lista) => {listaLivrosInicial = lista}); */
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    tabControllerBottom.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (BuildContext context) => UserBloc(),
        ),
      ],
      child: Scaffold(
        bottomNavigationBar: menuBottom(),
        body: TabBarView(
          controller: tabControllerBottom,
          children: [
            tabsScreen(),
            blocBody(),
            Container(child: Icon(Icons.info)),
            Container(child: Icon(Icons.notifications)),
          ],
        ),
      ),
    );
  }

  Widget menuBottom() {
    return Container(
      color: Colors.grey.shade200,
      child: TabBar(
        labelColor: Colors.blue,
        unselectedLabelColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: Colors.transparent,
        tabs: const [
          Tab(
            text: "Favoritos",
            icon: Icon(Icons.favorite),
          ),
          Tab(
            text: "Buscar",
            icon: Icon(Icons.search),
          ),
          Tab(
            text: "Info",
            icon: Icon(Icons.info),
          ),
          Tab(
            text: "Notificações",
            icon: Icon(Icons.notifications),
          ),
        ],
        controller: tabControllerBottom,
      ),
    );
  }

  Widget tabsScreen() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3F5AA6),
        title: Text(AppLocalizations.of(context)!.tituloApp),
        //toolbarHeight: kMinInteractiveDimension,
        bottom: TabBar(
          controller: tabController,
          tabs: const [
            Tab(
              text: 'Lendo',
            ),
            Tab(
              text: 'Lista de Desejos',
            ),
            Tab(
              text: 'Minhas Listas',
            ),
          ], // your tab bars
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          _construirTabLendo(),
          Center(
            child: Text("Lista de Desejos"),
          ),
          Center(
            child: Text("Minhas Listas"),
          ),
        ], // your tab views
      ),
    );
  }

  Widget _construirTabLendo() {
    Livro livro = Livro(
        id: 1,
        titulo: 'Harry Potter e a Pedra Filosofal',
        descricao:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
        paginas: 350,
        paginasLidas: 230,
        imagem:
            'https://static.wikia.nocookie.net/harrypotter/images/9/9c/Capa_Harry_Potter_e_a_Pedra_Filosofal_%28filme%29.jpg/revision/latest?cb=20130101153136&path-prefix=pt-br');
    Livro livro2 = Livro(
        id: 2,
        titulo: 'Harry Potter e a Câmara Secreta',
        descricao: 'Descricao222222',
        paginas: 250,
        paginasLidas: 128,
        imagem: 'https://m.media-amazon.com/images/I/81jbivNEVML.jpg');
    List<Livro> listLivros = [livro, livro2];
    return Stack(
      children: [
        SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: listLivros.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            child: IntrinsicHeight(
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, top: 8, bottom: 8),
                                    child: Image(
                                      image: NetworkImage(
                                          listLivros[index].imagem),
                                      width: 100,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            listLivros[index].titulo,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 10),
                                          Flexible(
                                            fit: FlexFit.loose,
                                            child: Text(
                                              listLivros[index].descricao,
                                              maxLines: 5,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Icon(
                                                  Icons.auto_stories_outlined,
                                                  size: 25,
                                                ),
                                                Text(
                                                  '${listLivros[index].paginasLidas}-${listLivros[index].paginas}',
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.blue),
                                                ),
                                                Container(
                                                  width: 100,
                                                  child:
                                                      LinearProgressIndicator(
                                                    minHeight: 3,
                                                    backgroundColor: Colors
                                                        .lightBlueAccent
                                                        .shade100,
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      Colors.lightBlue,
                                                    ),
                                                    value: listLivros[index]
                                                            .paginasLidas /
                                                        listLivros[index]
                                                            .paginas,
                                                  ),
                                                ),
                                                Icon(Icons
                                                    .favorite_border_outlined),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: EdgeInsets.only(right: 16.0, bottom: 16.0),
            child: FloatingActionButton(
              mini: true,
              onPressed: () {
                print('Add livro');
              },
              child: Icon(Icons.add),
            ),
          ),
        ),
      ],
    );
  }

  Widget _construirTabMinhaLista(List<ListaLivros> lista) {
    return Column(
      children: [
        ListView.builder(
            itemCount: lista.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Card(
                    color: Theme.of(context).primaryColor,
                    child: ListTile(
                        title: Text(
                          '${lista[index].titulo} (${lista[index].quantidade})',
                          style: const TextStyle(color: Colors.white),
                        ),
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(lista[index].imagem.toString()),
                        ))),
              );
            }),
        ElevatedButton(onPressed: () {}, child: Text("Adicionar Lista")),
      ],
    );
  }

  Widget blocBody() {
    return BlocProvider(
      create: (context) => UserBloc()..add(LoadUserEvent()),
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UserLoadedState) {
            List<UserModel> userList = state.users;
            return ListView.builder(
                itemCount: userList.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Card(
                        color: Theme.of(context).primaryColor,
                        child: ListTile(
                            title: Text(
                              '${userList[index].firstName}  ${userList[index].lastName}',
                              style: const TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              '${userList[index].email}',
                              style: const TextStyle(color: Colors.white),
                            ),
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  userList[index].avatar.toString()),
                            ))),
                  );
                });
          }
          if (state is UserErrorState) {
            return const Center(
              child: Text("Error"),
            );
          }

          return Container();
        },
      ),
    );
  }
}
