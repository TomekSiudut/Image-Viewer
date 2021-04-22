import 'dart:convert';
import "package:http/http.dart" as http;
import 'package:images/models/image_model.dart';

class ImageRepository {
  static Uri url = Uri.parse(
      "https://api.unsplash.com/photos/?client_id=CWE41DrXlU8y_ydYjcFH6z4_SUwCU5NGFKjF2w87x4s");

  Future<List<ImageModel>> getNewImages() async {
    final response = await http.get(url);
    List imgData = json.decode(response.body);
    List images = imgData.map((image) => ImageModel.fromJson(image)).toList();
    return images;
  }
}
