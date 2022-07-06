import 'package:bayraklar_quiz/QuizEkrani.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false ,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {


  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anasayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("QUİZE HOŞGELDİNİZ",style: TextStyle(color: Colors.teal, fontSize: 30), ),
            SizedBox(height: 50, width: 250,
              child: ElevatedButton(
                   child:Text("QUİZE BAŞLA"),
                onPressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => QuizEkrani() ));
                },
              ),
            )

          ],
        ),
      ),

    );
  }
}
