import "package:flutter/material.dart";

class ImageModel {
  String imageUrl;
  String title;
  String description;

  ImageModel(
      {@required this.imageUrl,
      @required this.title,
      @required this.description});
}
