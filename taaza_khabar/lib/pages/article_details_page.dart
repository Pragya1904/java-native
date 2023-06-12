import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/article_model.dart';

class ArticlePage extends StatelessWidget {
  //const ArticlePage({Key? key}) : super(key: key);
  final Article article;
  static const String id = "details";

  const ArticlePage(this.article, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          article.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            overflow: TextOverflow.ellipsis,
            fontStyle: FontStyle.normal,
          ),
          softWrap: true,
          maxLines: 1,
        ),
      ),
      body:  Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(article.source.name,style: const TextStyle(color: Colors.white),),
            ),
             SizedBox(height: MediaQuery.of(context).size.height*0.01,),
            Container(
              height:MediaQuery.of(context).size.height*0.25,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(article.urlToImage),fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(17),
              ),
            ),
             SizedBox(height: MediaQuery.of(context).size.height*0.01),
            InkWell(
              onLongPress:()async{
                await Clipboard.setData(ClipboardData(text: article.url));
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Copied to Clipboard")));
              } ,
              onTap: () async {
                print("clicked the link");
                await launchUrl(Uri.parse(article.url));
              },
              child: Text(article.url,style: const TextStyle(
                color: Colors.indigo,
                fontSize: 15,
                fontStyle: FontStyle.normal,
                decoration: TextDecoration.underline
              ),
                maxLines: 2,),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.017),
            Text(article.title,style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              overflow: TextOverflow.ellipsis,
              fontStyle: FontStyle.italic,

            ),softWrap: true,
            maxLines: 5,),
            SizedBox(height: MediaQuery.of(context).size.height*0.022),
            Expanded(
              child: Text(article.content,style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  overflow: TextOverflow.visible,
                  wordSpacing:15,
                  fontStyle: FontStyle.normal,
                  ),textAlign: TextAlign.justify,),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.042),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("~${article.author}",style: const TextStyle(
                color: Color(0xff381a60),
                fontSize: 16,
                overflow: TextOverflow.visible,
                wordSpacing:3,
                fontStyle: FontStyle.italic,
              ),textAlign: TextAlign.left,),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.01),
            Expanded(
              child: Text(article.description,style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                overflow: TextOverflow.visible,
                wordSpacing:7,
                fontStyle: FontStyle.normal,
              ),textAlign: TextAlign.justify,),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.015),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(article.publishedAt.toString(),style: const TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                  fontStyle: FontStyle.normal,
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
