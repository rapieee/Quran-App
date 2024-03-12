import 'dart:convert';

List<DoaModel> doaFromJson(String str)  => List<DoaModel>.from(
  json.decode(str).map(
    (x) => DoaModel.fromJson(x),
     ),
     );

class DoaModel {
  String? title;
  String? arabic;
  String? latin;
  String? translation;
  Null? notes;
  String? fawaid;
  String? source;

  DoaModel(
      {this.title,
      this.arabic,
      this.latin,
      this.translation,
      this.notes,
      this.fawaid,
      this.source});

  DoaModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    arabic = json['arabic'];
    latin = json['latin'];
    translation = json['translation'];
    notes = json['notes'];
    fawaid = json['fawaid'];
    source = json['source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['arabic'] = this.arabic;
    data['latin'] = this.latin;
    data['translation'] = this.translation;
    data['notes'] = this.notes;
    data['fawaid'] = this.fawaid;
    data['source'] = this.source;
    return data;
  }
}
