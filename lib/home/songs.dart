import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class Songs extends StatefulWidget {
  Songs({Key? key}) : super(key: key);

  @override
  State<Songs> createState()=> _SongsState();
}

class _SongsState extends State<Songs> {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
      ),
      body: Column(
        children: [
          Expanded(
            child: 
              ListView(
                children: <CustomSongCardsLists>[
                    CustomSongCardsLists(
                      image: "https://akamai.sscdn.co/uploadfile/letras/albuns/1/6/a/6/608811511359601.jpg",
                      song_name: "Infinity",
                      author: "Jaymes Young",
                    )
                ],
              )
          ),
        ],
      )
    );
  }
}

class CustomSongCardsLists extends StatelessWidget{
  const CustomSongCardsLists({
    super.key,
    required this.image,
    required this.song_name,
    required this.author
  });

  final String image;
  final String song_name;
  final String author;

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.all(20),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              children: [
                Container(
                height: MediaQuery.of(context).size.height * 0.40,
                width: MediaQuery.of(context).size.width* 0.88,
                decoration: BoxDecoration(
                  image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage('$image'),
                  ),
                  )
                ),
                Positioned(
                  top:310,
                  child: 
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                        color: Color.fromARGB(214, 33, 149, 243),
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        width: 380,
                        child: 
                        Column(children: [
                          Text("$song_name", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                          Text("$author"),
                        ],)
                      )]
                    ),
                ),
                IconButton(
                  icon: Icon(Icons.favorite), 
                  onPressed: (() {
                    Navigator.of(context).pushNamed("/songScreen");
                  })
                ),
              ],
            )
          ],
        )
      ),
    );
  }

}
