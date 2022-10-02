import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:p1_mob_dev/home/songs.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState()=> _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _animate = false;
  String message_toque = "Toque para escuchar";

  // @override
  // void initState(){
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).padding.top),
        child: SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
      ),            
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                message_toque, style: TextStyle(fontSize: 20),
              ),
              AvatarGlow(
                animate: _animate,
                // animate: true,
                endRadius: 100,
                glowColor: Colors.red,
                duration: Duration(milliseconds: 6000),
                repeat: true,
                repeatPauseDuration: Duration(milliseconds: 20),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: ElevatedButton(
                    child: Image.asset('assets/img_button.png'),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.blue
                      ),
                    onPressed: (){
                      setState(() {
                        _animate = !_animate;
                        message_toque = "Escuchando...";
                      });
                    }, 
                  ),
                  radius: 70,
                ),
              ),
              ElevatedButton(
                child: Icon(Icons.favorite),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(50,50),
                  shape: CircleBorder(),
                ),
                onPressed: (){
                  Navigator.of(context).pushNamed("/songs");
                }, 
              ),
              // SizedBox(height: 60,)
            ],
          ),
        ],
      )
    );
  }
}