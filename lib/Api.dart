import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:youtube/Model/Video.dart';

const CHAVE_API = '';
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
            "&maxResults=30"
            "&order=date"
            "&key=$CHAVE_API"
            "&q=$pesquisar";

    http.Response vResponse = await http.get(Uri.parse(vUrl));

    if (vResponse.statusCode == 200) {
      Map<String, dynamic> vObjetoJson = json.decode(vResponse.body.toString());

      ///crio uma lista de objeto Video e alimento essa lista varendo o <Map> do json.
      List<Video> vMinhaListaObjetosVideo = [];

      ///Varendo meu json...
      for (var i = 0; i <= vObjetoJson.values.length; i++) {
        Video vObjetoVideo = Video(
            vObjetoJson["items"][i]["id"]["videoId"].toString(),
            vObjetoJson["items"][i]["snippet"]["title"].toString(),
            vObjetoJson["items"][i]["snippet"]["description"].toString(),
            vObjetoJson["items"][i]["snippet"]["thumbnails"]["high"]["url"].toString(),
            vObjetoJson["items"][i]["snippet"]["channelTitle"].toString());

        //Add Meu objeto para a minha lista
        vMinhaListaObjetosVideo.add(vObjetoVideo);
      }

      return vMinhaListaObjetosVideo;

    } else {
      //Nadaaa
    }
    ;
  }
}
