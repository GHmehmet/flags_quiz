import 'package:flutter/material.dart';

class SonucEkrani extends StatefulWidget {

  late int dogruSayisi;

  @override
  State<SonucEkrani> createState() => _SonucEkraniState();

  SonucEkrani({required this.dogruSayisi});
}

class _SonucEkraniState extends State<SonucEkrani> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SonucEkrani"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
            Text("Doğru Sayısı: ${widget.dogruSayisi}  Yanliş Sayısı: ${5-widget.dogruSayisi}", style: TextStyle(color: Colors.teal, fontSize: 30),),
            Text("% ${(widget.dogruSayisi*100/5).toInt()} BAŞARI", style: TextStyle(color: Colors.pink, fontSize: 30),),
            SizedBox(height: 50, width: 250,
              child: ElevatedButton(
                child:Text("TEKRAR DENE"),
                onPressed: (){
                  Navigator.pop(context);

                },
              ),
            ),
          ],
        ),
      ),

    );
  }
}
