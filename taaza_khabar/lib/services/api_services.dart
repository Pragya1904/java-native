//http request services
//this allows us to create simple get request from the api and fetches the articles in the api and returs the list of articles

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:taaza_khabar/models/article_model.dart';
class ApiService
{
  //added the api endpoint from the newsapi.org documentation
  final apiEndpoint="https://newsapi.org/v2/everything?domains=techcrunch.com,thenextweb.com&apiKey=54dc290cb24f4e4f8c22658d617f4ef6";

  //step 2: http request function--> for this add dependency of http in pubspec.yaml --->http package
  Future<List<Article>> getArticle() async{
    print("getArticle method called");
    final  res=await http.get(Uri.parse(apiEndpoint));
    print("getArticle method called 222");
    print(res.statusCode);
    if(res.statusCode==200)
      {

       Map<String,dynamic> json=jsonDecode(res.body);
       print("meri abhi ki date");
        print(DateTime.now());
       //body is a list of articles in json
       // List<dynamic> body1=json['articles'];
      print("rticles recieved successfully!!");
       //below line is written to get different articles from the json file and puts them into a list named articles
      // print(body);
      // List<Article> articles=
     //  body.map((dynamic item) => Article.fromJson(item)).toList();
      final List<dynamic> body = jsonDecode(res.body)['articles'];
      print(body);
      print("****************************************************");
     // print(body1);
       List<Article> articles =
      body.map((dynamic item) => Article.fromJson(item)).toList();
      print("-------------------------------------------------");
      print(articles);
      return articles;
      //step 3: call this service from home page
      }
    else
      {
       print("rticles recieved unsuccessfully!!");
        throw("Couldn't fetch the articles");
      }

  }

}