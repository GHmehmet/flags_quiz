import 'dart:collection';

import 'package:bayraklar_quiz/Bayraklar.dart';
import 'package:bayraklar_quiz/SonucEkrani.dart';
import 'package:bayraklar_quiz/bayraklardao.dart';

import 'package:flutter/material.dart';

class QuizEkrani extends StatefulWidget {
  const QuizEkrani({Key? key}) : super(key: key);

  @override
  State<QuizEkrani> createState() => _QuizEkraniState();
}

class _QuizEkraniState extends State<QuizEkrani> {

  var sorular = <Bayraklar>[];
  var yanlisSecenekler = <Bayraklar>[];
  late Bayraklar dogrusoru;
  var tumSecenekler = HashSet<Bayraklar>();


  int dogruSayac = 0;
  int yanlisSayac = 0;
  int soruSayac = 0;

  String bayrakResimAd = "placeholder.png";
  String buttonAYazi = "";
  String buttonBYazi = "";
  String buttonCYazi = "";
  String buttonDYazi = "";



 @override
  void initState(){
   super.initState();
   SorulariAl();
 }

 Future<void> SorulariAl() async{
   sorular =await bayraklardao().soru5Getir();
   print(sorular[0].bayrak_ad);
   SorulariYukle();
 }

 Future<void> SorulariYukle() async{
   dogrusoru = sorular[soruSayac];


   yanlisSecenekler = await bayraklardao().yanlis3Getir(dogrusoru.bayrak_id);


   bayrakResimAd = dogrusoru.bayrak_resim;


   tumSecenekler.clear();
   tumSecenekler.add(dogrusoru);
   tumSecenekler.add(yanlisSecenekler[0]);
   tumSecenekler.add(yanlisSecenekler[1]);
   tumSecenekler.add(yanlisSecenekler[2]);

   print(tumSecenekler.elementAt(0).bayrak_ad);
   print(tumSecenekler.elementAt(1).bayrak_ad);
   print(tumSecenekler.elementAt(2).bayrak_ad);
   print(tumSecenekler.elementAt(3).bayrak_ad);


   buttonAYazi =  tumSecenekler.elementAt(0).bayrak_ad;
   buttonBYazi =  tumSecenekler.elementAt(1).bayrak_ad;
   buttonCYazi =  tumSecenekler.elementAt(2).bayrak_ad;
   buttonDYazi =  tumSecenekler.elementAt(3).bayrak_ad;



   setState((){

   });
 }

 void SoruSayacKontrol(){
   soruSayac = soruSayac +1;

   if (soruSayac!=5){
     SorulariYukle();
   }else{
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SonucEkrani(dogruSayisi: dogruSayac,) ));
   }
 }

 void dogruKontrol(String bayrak_ad){
   if(bayrak_ad== dogrusoru.bayrak_ad){
     dogruSayac = dogruSayac+1;
   }else{
     yanlisSayac = yanlisSayac+1;
   }

 }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ouiz Ekrani"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Doğru Sayısı: $dogruSayac ", style: TextStyle(color: Colors.teal),),
                Text("Yanlış Sayısı: $yanlisSayac", style: TextStyle(color: Colors.red),),
              ],
            ),
            Text("${soruSayac+1}. SORU", style: TextStyle(fontSize: 30,),),
            Padding(
              padding: const EdgeInsets.only(left: 60,right: 60),
              child: Image.asset("resimler/$bayrakResimAd"),
            ),
            SizedBox(height: 50, width: 250,
              child: ElevatedButton(
                child:Text(buttonAYazi),
                onPressed: (){
                  dogruKontrol(buttonAYazi);
                  SoruSayacKontrol();

                },
              ),
            ),
            SizedBox(height: 50, width: 250,
              child: ElevatedButton(
                child:Text(buttonBYazi),
                onPressed: (){
                  dogruKontrol(buttonBYazi);
                  SoruSayacKontrol();


                },
              ),
            ),
            SizedBox(height: 50, width: 250,
              child: ElevatedButton(
                child:Text(buttonCYazi),
                onPressed: (){
                  dogruKontrol(buttonCYazi);
                  SoruSayacKontrol();


                },
              ),
            ),
            SizedBox(height: 50, width: 250,
              child: ElevatedButton(
                child:Text(buttonDYazi),
                onPressed: (){
                  dogruKontrol(buttonDYazi);
                  SoruSayacKontrol();

                },
              ),
            )



          ],
        ),
      ),

    );
  }
}
