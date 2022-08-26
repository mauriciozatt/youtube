import 'package:flutter/material.dart';

class TelaPesquisar extends SearchDelegate<String> {



  @override
  List<Widget>? buildActions(BuildContext context) {
    /// TODO: Lista de Widgets, posso aqui criar vários botões de ação. Ex: limpar o que foi digitado.....
    return [
      IconButton(
          onPressed: () {
            ///Query é onde é armazenado os valores que e o usuário está digitando....
            query = "";
          },
          icon: Icon(Icons.clear)),
    ];
  }




  @override
  Widget? buildLeading(BuildContext context) {
    /// TODO: Este método e o responsável por criar as ações do lado esquerdo da barra.. OBS: Retorna somente um Widget
    return IconButton(onPressed: () {
      ///Método close fecha a tela de pesquisa é retorna um result para eu recuperar no método que chamou na tela de origem... Neste caso retorno "";
      close(context, "");
    },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: Este método retorna o "Valor" - chamado quando se confirma na tela pesquisa.
    ///Fecho a tela e retorno a Query(valor digitado) para usar no método de origem...
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: Essse método da sugestão...

    List vLista = ["Brasil", "Bolsa De Valores", "Futebol", "Flutter", "Rock"];

    List vListaComFiltro = [];
    vListaComFiltro.clear();



///Monto uma lista somente com base no que o cara digitou.... filtrooooo
    for (var i = 0; i <= vLista.length-1; i++ ){

     String vTexto =  vLista[i].toString().toLowerCase();

     if (vTexto.startsWith(query.toString().toLowerCase())){
       vListaComFiltro.add(vLista[i].toString()) ;
     };
    }


    return ListView.builder(
      itemCount: vListaComFiltro.length,
        itemBuilder: (context,i){

        return ListTile(
          title: Text(vListaComFiltro[i].toString()),

          onTap: (){
            close(context, vListaComFiltro[i].toString()); ///Fecho a tela e retorna o valore selecionado...
          },

        );


        }
    );


  }
}
