
import 'package:taaza_khabar/models/source_model.dart';

// To parse this JSON data, do
//
//     final article = articleFromJson(jsonString);

import 'dart:convert';

Article articleFromJson(String str) => Article.fromJson(json.decode(str));

//String articleToJson(Article data) => json.encode(data.toJson());

class Article {
  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String content;

  //function that will map the json  into a list
  factory Article.fromJson(Map<String, dynamic> json) => Article(
    source: Source.fromJson(json["source"]),
    author: json["author"] ?? "no author",
    title: json["title"]?? "no title",
    description: json["description"]?? "no desc",
    url: json["url"]?? "no url",
    urlToImage: json["urlToImage"]?? "no author",
    publishedAt: DateTime.parse(json["publishedAt"]),
    content: json["content"]?? "no content",
  );

  // Map<String, dynamic> toJson() => {
  //   "source": source.toJson(),
  //   "author": author,
  //   "title": title,
  //   "description": description,
  //   "url": url,
  //   "urlToImage": urlToImage,
  //   "publishedAt": publishedAt.toIso8601String(),
  //   "content": content,
  // };
}


