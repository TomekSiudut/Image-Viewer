import "package:flutter/material.dart";

class ImageModel {
  String imageUrl;
  String title;

  ImageModel({
    @required this.imageUrl,
    @required this.title,
  });

  ImageModel.fromJson(json)
      : title = json['alt_description'],
        imageUrl = json['urls']["regular"];

  ImageModel.fromSearchJson(json)
      : title = json["results"]['alt_description'],
        imageUrl = json["results"]['alt_description'];
}
