import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:list_flutter/model/models.dart';
import 'dart:async';
import 'dart:convert';
import 'views/viewscell.dart';
import 'details.dart';
/*
I have two state to this app
 */
void main() => runApp(new HelloWorldApp());

class HelloWorldApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HelloWorldState();
  }
}

class HelloWorldState extends State<HelloWorldApp> {
  var _isLoading = true;
  final url = "https://api.letsbuildthatapp.com/youtube/home_feed";

  // this class to handle first state
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: new AppBar(
          title: new  Text("Hello world"),
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.refresh), onPressed: onRefreshPressed),
          ],
        ),
        body: new FutureBuilder(
            future: fetchVideos(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Video> videos = snapshot.data;
                return new ListView.builder(
                    itemCount: videos != null ? videos.length : 0,
                    itemBuilder: (context, i) {
                      final video = videos[i];
                      return new FlatButton(
                          padding: new EdgeInsets.all(0.0),
                          onPressed: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => new DetailsPage()));
                          },
                          child: VideoCell(video));
                    });
              } else if (snapshot.hasError) {
                return new Text("${snapshot.error}");
              }
              return new Center(child: new CircularProgressIndicator());
            }),
      ),
    );
  }

  void onRefreshPressed() {
    setState(() {
      fetchVideos();
      _isLoading = !_isLoading;
    });
  }

  Future<List<Video>> fetchVideos() async {
    final response = await http.get(url);
    final responseJson = json.decode(response.body);
    List<Video> videos = new List();
    responseJson["videos"].forEach((json) {
      Video v = Video.fromJson(json);
      videos.add(v);
      print(videos[0].name);
    });
    return videos;
  }
}


