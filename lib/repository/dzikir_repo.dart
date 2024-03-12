import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:quran_app/model/dzikir_model.dart';
import 'package:http/http.dart' as http;

class DzikirRepository {
  
  Future<List<Dzikir>> getListDzikir() async{
    String data = await rootBundle.loadString('assets/data/list-dzikir-pagi.json');

   return dzikirFromJson(data);
  }

  Future<Dzikir> getListPagi(String id_dzikir) async {
    String url = 
      'https://equran.id/api/surat/$id_dzikir';
      var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return Dzikir.fromJson(body);
    }
    throw Exception("Error");
  }

  Future<List<Dzikir>> getListPetang() async{
    String data = await rootBundle.loadString('assets/data/list-dzikir-petang.json');

   return dzikirFromJson(data);
  }
  Future<Dzikir> getListSore(String id_dzikir) async {
    String url = 
      'https://equran.id/api/surat/$id_dzikir';
      var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return Dzikir.fromJson(body);
    }
    throw Exception("Error");
  }
}