import 'package:flutter/material.dart';
import 'package:taaza_khabar/services/api_services.dart';

import '../components/custom_list_tile.dart';
import '../models/article_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static const String id = "homePage";
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  ApiService client = ApiService();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Taaza Khabar'),
      ),
      body: FutureBuilder<List<Article>>(
        builder: (context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text("hello dev the snapshot error is: ${snapshot.error}");   //type NULL is not a subtype of String
          } else if (snapshot.hasData && snapshot.data != null) {
            List<Article> articles = snapshot.data!;
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return customListTile(articles[index],context);
              },
            );
          } else {
            return const Text("No articles found.");
          }
        },
        future: client.getArticle(),
      ),
    );
  }
}
