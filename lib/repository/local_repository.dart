import 'package:images/models/image_model.dart';

class LocalRepository {
  Future<List<ImageModel>> getFavImages() async {
    return [
      ImageModel(
          title: "TEST",
          imageUrl:
              "https://images.unsplash.com/photo-1585399000684-d2f72660f092?crop=entropy&")
    ];
  }

  Future<void> addNewImage() async {
    print("I add new image to data base");
  }

  Future<void> deleteImage(int index) async {
    print("i want to delete this image ${index}");
  }
}
