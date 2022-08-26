import 'package:flutter/material.dart';

class Inscricoes extends StatefulWidget {
  const Inscricoes({Key? key}) : super(key: key);

  @override
  State<Inscricoes> createState() => _InscricoesState();
}

class _InscricoesState extends State<Inscricoes> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Divider(height: 0, color: Colors.white70)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CircleAvatar(backgroundImage: AssetImage("img/canal1.png")),
            CircleAvatar(backgroundImage: AssetImage("img/canal2.png")),
            CircleAvatar(backgroundImage: AssetImage("img/canal3.jpg")),
            CircleAvatar(backgroundImage: AssetImage("img/canal4.png")),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "Canal 1",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "Canal 2",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "Canal 3",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "Canal 4",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        Divider(height: 10, color: Colors.white70),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            //mainAxisAlignment:  MainAxisAlignment.spaceAround,

            children: <Widget>[


              Padding(
                padding: EdgeInsets.only(right: 5),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.white24)),
                  child: Text("Tudo"),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(right: 5),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Colors.white24)),
                  child: Text("Hoje"),
                ),
              ),


              Padding(
                padding: EdgeInsets.only(right: 5),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Colors.white24)),
                  child: Text("Continuar Assistindo"),
                ),
              ),


              Padding(
                padding: EdgeInsets.only(right: 5),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Colors.white24)),
                  child: Text("Não Assistido"),
                ),
              ),









            ],
          ),
        )
      ],
    );
  }
}
