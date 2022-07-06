import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class dbYardimcisi{

  static final String dbAdi = "bayraklar.sqlite";

  static Future<Database> dbErisim() async{
    String dbYol = join(await getDatabasesPath(),dbAdi);

    // db var mı yok mu kontrolü yapılıyor.
    if(await databaseExists(dbYol)){
      // db varsa bir sey yapmaya gerek yok, yoksa yüklenmesini sağlayacaz.
    }else{
      ByteData data = await rootBundle.load("veritabani/$dbAdi");
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(dbYol).writeAsBytes(bytes,flush: true);
    }
    return openDatabase(dbYol);
  }
}