import 'dart:convert';
import "package:http/http.dart" as http;
import 'package:images/models/image_model.dart';
import 'package:images/models/search_list_model.dart';

class ImageRepository {
  static Uri url = Uri.parse(
      "https://api.unsplash.com/photos/?client_id=CWE41DrXlU8y_ydYjcFH6z4_SUwCU5NGFKjF2w87x4s");

  Future<List<ImageModel>> getNewImages() async {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List imgData = json.decode(response.body);
      List<ImageModel> images =
          imgData.map((image) => ImageModel.fromJson(image)).toList();
      return images;
    } else {
      return [];
    }
  }

  Future<List<ImageModel>> searchImagesByKeyword(String keyword) async {
    final Uri url = Uri.parse(
        "https://api.unsplash.com/search/photos?page=1&query=$keyword&client_id=CWE41DrXlU8y_ydYjcFH6z4_SUwCU5NGFKjF2w87x4s");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final imgData = json.decode(response.body);
      SearchListModel imagesFromJson = SearchListModel.fromJson(imgData);
      List<ImageModel> images = imagesFromJson.images
          .map((image) => ImageModel.fromJson(image))
          .toList();
      return images;
    } else {
      return [];
    }
  }
}
