 class Video {
   var id, name, link, imageUrl, numberOfViews;

   Video({this.id, this.name, this.link, this.imageUrl, this.numberOfViews});

   factory Video.fromJson(Map<String, dynamic> json) {
     return new Video(
       id: json['id'],
       name: json['name'],
       link: json['link'],
       imageUrl: json['imageUrl'],
       numberOfViews: json['numberOfViews'],
     );
   }
 }

 class Detail{
  var name,duration,number,imageUrl,link;
  Detail({this.name, this.duration, this.number, this.imageUrl, this.link});

  factory Detail.fromJson(Map<String, dynamic> json) {
    return new Detail(
      name: json['name'],
      duration: json['duration'],
      number: json['number'],
      imageUrl: json['imageUrl'],
      link: json['link'],
    );
  }


 }