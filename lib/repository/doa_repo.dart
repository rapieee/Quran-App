import 'package:flutter/services.dart';
import 'package:quran_app/model/doa_model.dart';
class DoaRepository {
  
  Future<List<DoaModel>> getListDoa() async{
    String data = await rootBundle.loadString('assets/data/list-dzikir-harian.json');

   return doaFromJson(data);
  }

}