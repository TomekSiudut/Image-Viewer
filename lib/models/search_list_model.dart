import "package:flutter/material.dart";

class SearchListModel {
  List images;
  SearchListModel({@required this.images});

  SearchListModel.fromJson(json) : images = json["results"];
}
