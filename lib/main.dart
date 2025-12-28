import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String randomLetter='A';
  List<String> letters=['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
  void generaterandom(){
    setState(() {
      randomLetter=letters[Random().nextInt(letters.length)];
    });

  }
  final AudioPlayer player=AudioPlayer();
  void playAudio(String letter)async{
    setState(() {
      randomLetter=letter;
    });

    if(letter==randomLetter) {
      await player.stop();
      await player.play(
          AssetSource("audios/$letter.mp3"),

      );
      generaterandom();
    }
  }
  GestureDetector copyContainer({required String letter }){
   return  GestureDetector(
     onTap:()async{
       setState(() {
         randomLetter=letter;

       });
       playAudio(letter);
     },
     child: Container(
        width: 50,
        height: 50,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey[500],
          boxShadow: [BoxShadow(
            color:Colors.black54,
            blurRadius: 3,
            offset: Offset(0,4),
          ),],
          borderRadius: BorderRadius.circular(3),
        ),
        child:Center(
          child: Text(letter,style:TextStyle(fontWeight: FontWeight.bold,color:Colors.white
          ),),
        ),


      ),
   );

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner: false,
      home:Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.white,
            toolbarHeight: 70,title:Text("English Letters Sound",style:GoogleFonts.inter(color:Colors.black,fontWeight: FontWeight.bold) ,),
          centerTitle: true,
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.vertical(
              bottom: Radius.circular(60),
            ),
          ),

        ),
        body:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/$randomLetter.png",width: 270,),
            SizedBox(height: 40,),
            Divider(indent: 20,endIndent: 20,),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                copyContainer(letter: 'A'),
                SizedBox(width: 10,),
                copyContainer(letter: 'B'),
                SizedBox(width: 10,),
                copyContainer(letter: 'C'),
                SizedBox(width: 10,),
                copyContainer(letter: 'D'),
                SizedBox(width: 10,),
                copyContainer(letter: 'E'),
                SizedBox(width: 10,),
                copyContainer(letter: 'F'),
                SizedBox(width: 10,),
                copyContainer(letter: 'G'),


                  ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                copyContainer(letter: 'H'),
                SizedBox(width: 10,),
                copyContainer(letter: 'I'),
                SizedBox(width: 10,),
                copyContainer(letter: 'J'),
                SizedBox(width: 10,),
                copyContainer(letter: 'K'),
                SizedBox(width: 10,),
                copyContainer(letter: 'L'),
                SizedBox(width: 10,),
                copyContainer(letter: 'M'),
                SizedBox(width: 10,),
                copyContainer(letter: 'N'),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                copyContainer(letter: 'O'),
                SizedBox(width: 10,),
                copyContainer(letter: 'P'),
                SizedBox(width: 10,),
                copyContainer(letter: 'Q'),
                SizedBox(width: 10,),
                copyContainer(letter: 'R'),
                SizedBox(width: 10,),
                copyContainer(letter: 'S'),
                SizedBox(width: 10,),
                copyContainer(letter: 'T'),
                SizedBox(width: 10,),
                copyContainer(letter: 'U'),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                copyContainer(letter: 'V'),
                SizedBox(width: 10,),
                copyContainer(letter: 'W'),
                SizedBox(width: 10,),
                copyContainer(letter: 'X'),
                SizedBox(width: 10,),
                copyContainer(letter: 'Y'),
                SizedBox(width: 10,),
                copyContainer(letter: 'Z'),

              ],
            )
          ],
        ),
     ),
    );
  }
}
