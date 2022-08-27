import 'package:flutter/material.dart';
import 'package:youtube/Api.dart';
import 'package:youtube/Model/Video.dart';
import 'package:youtube/TelaExibirVideo.dart';

class Inicio extends StatefulWidget {
  String? pesquisa;

  Inicio({Key? key, this.pesquisa}) : super(key: key);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  Future<List<Video?>?> _ListarVideos(String? pPesquisa) {

    Api vApi = new Api();
    return vApi.pesquisar(pPesquisa);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video?>?>(
        future: _ListarVideos(widget.pesquisa),
        builder: (context, snapshot) {

          switch (snapshot.connectionState) {
            case ConnectionState.none:

            ///carregando
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.active:

            ///Status OK
            case ConnectionState.done:
              if (snapshot.hasData) {
                return ListView.separated(
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () {

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TelaExibirVideo(
                                      idVideo: snapshot.data![i]!.id.toString()
                                  )
                              )
                          );
                        },

                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,

                                    /// Define quando espaço a imagem irá ocupar...
                                    image: NetworkImage(
                                        snapshot.data![i]!.imagem.toString()),
                                  )),
                            ),
                            ListTile(
                              title: Text(
                                snapshot.data![i]!.titulo,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              subtitle: Text(
                                snapshot.data![i]!.canal,
                                style: TextStyle(color: Colors.white54),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, i) => Divider(height: 20,),
                    itemCount: snapshot.data!.length ///Quantidade da  minha lista de videos
                );
              }
              else {
                return Center(
                  child: Text("Nenhuma informação para exibir! Provalmente cotas de consultas excedidas",
                  style: TextStyle(color: Colors.white),
                  ),
                );
              }
          }
        });
  }
}
