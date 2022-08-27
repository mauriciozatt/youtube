import 'package:flutter/material.dart';
import 'package:youtube/Telas/EmAlta.dart';
import 'package:youtube/Telas/Inicio.dart';
import 'package:youtube/Telas/Biblioteca.dart';
import 'package:youtube/Telas/Inscricoes.dart';
import 'package:youtube/TelaPesquisar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override

  ///Var
  int _IndexDaPagina = 0;
  String _vResultPesquisa = '';


  Widget build(BuildContext context) {


    List<Widget> _ListaTelas = [
      Inicio(pesquisa: _vResultPesquisa),
      EmAlta(),
      Container(),
      Inscricoes(),
      Biblioteca()
    ];



    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
        title: Image.asset(
          "img/youtube.jpg",
          width: 100,
          height: 50,
        ),

        ///botões de ação
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {},
          ),

          IconButton(
            icon: Icon(Icons.search),

            /// O método ShowSearch é um future por esse fator eu não sei quanto tempo vai demorar para fechar a tela, por isso deve usar o async e await..
            onPressed: () async {

           String ?vReturnPesquisa = await showSearch(context: context, delegate: new TelaPesquisar());

              setState(() {

                if (vReturnPesquisa != '') {
                  _vResultPesquisa = vReturnPesquisa!;
                }

              });
            },


          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.all(16),
        child: _ListaTelas[
            _IndexDaPagina], //Lista de Widgets (Minhas telas são Widgets)..
      ),


      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _IndexDaPagina,
          backgroundColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.red,


          ///Shifting da pra fazer umas coisas maneiras...

          ///toda vez que clico no meu BottomNavigationBar atualizo o valor do index selecionado para a minha variável..
          onTap: (i) {
            setState(() {
              _IndexDaPagina = i;
            });
          },

          items: [
            BottomNavigationBarItem(
                label: 'Início', icon: Icon(Icons.home)),

            BottomNavigationBarItem(
                label: 'Em Alta', icon: Icon(Icons.whatshot)),

            BottomNavigationBarItem(label: '', icon: Icon(
                Icons.add_circle_outline,
            size: 40,
            )),

            BottomNavigationBarItem(label: 'Inscrições', icon: Icon(Icons.subscriptions)),

            BottomNavigationBarItem(label: 'Biblioteca', icon: Icon(Icons.folder)),
          ]),
    );
  }
}
