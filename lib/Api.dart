import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:youtube/Model/Video.dart';

const CHAVE_API = 'AIzaSyAXeUt7Ki13MEtrzesguKI1aCqgVpjM9Hs';
const URL = 'https://www.googleapis.com/youtube/v3/';

class Api {
  //metodos
   Future<List<Video?>?> pesquisar(String ?pesquisar) async {
     //busca os dados...


    String vUrl = URL;

    vUrl = vUrl +
        "search"
            "?part=snippet"
            "&type=video"
            "&maxResults=10"
            "&order=date"
            "&key=$CHAVE_API"
            "&q=$pesquisar";


    print(vUrl);

    http.Response vResponse = await http.get(Uri.parse(vUrl));

    if (vResponse.statusCode == 200) {
      print("Entrou");
      Map<String, dynamic> vObjetoJson = json.decode(vResponse.body.toString());

      ///crio uma lista de objeto Video e alimento essa lista varendo o <Map> do json.
        List<Video> vMinhaListaObjetosVideo = [];


     //print("obj" + vObjetoJson["items"]["value"].toString());
      print("obj" + vObjetoJson["items"].toString());
      print("obj" + vObjetoJson.length.toString());


      ///Varendo meu json... Vare até o "maxResults=10" definido na consulta HTTP.
      for (var i = 0; i <= 9; i++) {
        Video vObjetoVideo = Video(
            vObjetoJson["items"][i]["id"]["videoId"].toString(),
            vObjetoJson["items"][i]["snippet"]["title"].toString(),
            vObjetoJson["items"][i]["snippet"]["description"].toString(),
            vObjetoJson["items"][i]["snippet"]["thumbnails"]["high"]["url"].toString(),
            vObjetoJson["items"][i]["snippet"]["channelTitle"].toString());

        //Add Meu objeto para a minha lista
        vMinhaListaObjetosVideo.add(vObjetoVideo);



        print("lista" + vMinhaListaObjetosVideo[i].titulo.toString());
      }

      return vMinhaListaObjetosVideo;

    }
    else {
      //Nadaaa
    };
  }
}
