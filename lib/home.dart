import 'dart:math';

import 'package:beni_http/model/quote_response.dart';
import 'package:beni_http/network/api_service.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  List<Color> colors = [
    Colors.red,
    Colors.indigo,
    Colors.green,
    Colors.amber,
    Colors.deepPurple,
    Colors.pink
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder<QuoteResponse>(
        future: ApiService.api.fetchQuotes(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var results = snapshot.data!.results;
            return ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(results[index].content),
                    subtitle: Text(results[index].author),
                    leading: Icon(
                      Icons.quora,
                      color: colors[Random().nextInt(colors.length)],
                    ),
                  )),
            );
          } else if (snapshot.hasError) {
            return Center(
                child: Text(
              snapshot.error.toString(),
              style: TextStyle(color: Colors.red),
            ));
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )),
    );
  }
}
