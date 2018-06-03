import 'package:flutter/material.dart';
import 'package:list_flutter/model/models.dart';

class VideoCell extends StatelessWidget {
  Video video;

  VideoCell(this.video)

  @override // ignore: missing_function_body
  Widget build(BuildContext context) {
    return new Card(
      child: new Column(
        children: <Widget>[
          new Image.network(
            video.imageUrl,
            height: 250.0,
          ),
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text(
              video.name,
              style: new TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailCell extends StatelessWidget {
  Detail detail;

  DetailCell(this.detail)

  @override
  Widget build(BuildContext context) {
    return new Container(

      padding: const EdgeInsets.all(5.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 12.0, 0.0),
            child: new Image.network(
              detail.imageUrl, width: 150.0,
              height: 80.0,
            ),
          ),
          new Flexible(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(height: 10.0),
              new Text(detail.name),
              new Container(height: 10.0),
              new Text(detail.duration),
              // new Text(detail.number+""),
            ],

          )
          ),
        ],
      ),

    );
  }

}