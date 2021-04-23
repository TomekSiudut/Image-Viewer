import "package:flutter/material.dart";

class ImageModel {
  String id;
  String imageUrl;
  String title;

  ImageModel(
      {@required this.imageUrl, @required this.title, @required this.id});

  ImageModel.fromJson(json)
      : id = json["id"],
        title = json['alt_description'],
        imageUrl = json['urls']["regular"];

  ImageModel.fromSearchJson(json)
      : title = json["results"]['alt_description'],
        imageUrl = json["results"]['alt_description'];

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'image_id': id,
      'imageUrl': imageUrl,
      'title': title
    };
    return map;
  }

  ImageModel.fromMap(Map<String, dynamic> map) {
    id = map["image_id"];
    imageUrl = map["imageUrl"];
    title = map["title"];
  }
}
