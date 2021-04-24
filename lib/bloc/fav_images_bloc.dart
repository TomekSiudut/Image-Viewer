import 'package:images/models/image_model.dart';
import 'package:images/repository/local_images_repository.dart';
import 'package:rxdart/subjects.dart';

class FavImagesBloc {
  final LocalImagesRepository _repository = LocalImagesRepository();
  final BehaviorSubject<List<ImageModel>> _subject =
      BehaviorSubject<List<ImageModel>>();

  getUserFavImages() async {
    final List<ImageModel> response = await _repository.getFavImages();
    _subject.sink.add(response);
  }

  void addNewImage(ImageModel image) {
    _repository.addNewImage(image);
  }

  Future<void> deleteImage(String id) async {
    await _repository.deleteImage(id);
    getUserFavImages();
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<List<ImageModel>> get subject => _subject;
}

final favImagesBloc = FavImagesBloc();
