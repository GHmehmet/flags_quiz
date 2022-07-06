import 'package:bayraklar_quiz/Bayraklar.dart';
import 'package:bayraklar_quiz/dbYardimcisi.dart';

class bayraklardao{



  Future<List<Bayraklar>> soru5Getir() async{
    print("bayraklardao çalıştı");


    var db = await dbYardimcisi.dbErisim();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM bayraklar  ORDER BY RANDOM() LIMIT 5");


    return(List.generate(maps.length, (i) {
      var satir = maps[i];
      return Bayraklar(satir["bayrak_id"],satir["bayrak_ad"],satir["bayrak_resim"]);


    }));

  }


  Future<List<Bayraklar>> yanlis3Getir(int bayrak_id) async{

    var db = await dbYardimcisi.dbErisim();

    List<Map<String,dynamic>> maps =await db.rawQuery("SELECT * FROM bayraklar WHERE bayrak_id!=$bayrak_id ORDER BY RANDOM() LIMIT 3 ");

    return(List.generate(maps.length, (i) {
      var satir = maps[i];
      return Bayraklar(satir["bayrak_id"], satir["bayrak_ad"], satir["bayrak_resim"]);


    } ));
  }
}

