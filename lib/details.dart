import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'views/viewscell.dart';
import 'package:list_flutter/model/models.dart';


class DetailsPage extends StatelessWidget {
  final url = "https://api.letsbuildthatapp.com/youtube/course_detail?id=1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Details Page"),
      ),
      body: new FutureBuilder(
          future: fetchDetails(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Detail> details = snapshot.data;
              return new ListView.builder(
                  itemCount: details != null ? details.length : 0,
                  itemBuilder: (context, i) {
                    final detail = details[i];
                   return DetailCell(detail);
                  });
            } else if (snapshot.hasError) {
              return new Text("${snapshot.error}");
            }
            return new Center(child: new CircularProgressIndicator());
          }),
    );
  }

  String getDetailsUrl(var id) {
    return url + id;
  }

  Future<List<Detail>> fetchDetails() async {
    final response = await http.get(url);
    final responseJson = json.decode(response.body);

    List<Detail> details = new List();
    responseJson.forEach((json) {
      Detail detail = Detail.fromJson(json);
      details.add(detail);
      print(details[0].name);
    });
    return details;
  }
}
