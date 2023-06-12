
import 'package:flutter/material.dart';
import 'package:taaza_khabar/models/article_model.dart';
import 'package:taaza_khabar/pages/article_details_page.dart';

Widget customListTile(Article article, BuildContext context)
{
  return GestureDetector(
    onTap: (){
     Navigator.push(context , MaterialPageRoute(builder: (context)=>ArticlePage(article)));
    },
    child: Container(
      margin:  EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
      padding:  EdgeInsets.all(MediaQuery.of(context).size.width*0.01),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 3,
          )
        ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.25,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(article.urlToImage),fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.006),
          Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(article.source.name,style: const TextStyle(color: Colors.white),),
          ),
           SizedBox(height: MediaQuery.of(context).size.width*0.005,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.006),
            child: Text(article.title,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
          )
        ],
      ),
    ),
  );
}