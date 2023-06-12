import 'dart:convert';
//source model to parse the json file easily
class Source{
  String id,name;
  Source({required this.id,required this.name});


  //factory function to map to json
factory Source.fromJson(Map<String,dynamic> json)
  {
    return Source(id: json['id'], name: json['name']);
  }
}