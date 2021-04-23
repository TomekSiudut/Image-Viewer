import 'dart:async';
import 'package:images/models/image_model.dart';
import 'package:images/repository/local_repository.dart';
import 'package:rxdart/subjects.dart';

class FavImagesBloc {
  final LocalRepository _repository = LocalRepository();
  final BehaviorSubject<List<ImageModel>> _subject =
      BehaviorSubject<List<ImageModel>>();

  getUserFavImages() async {
    final List<ImageModel> response = await _repository.getFavImages();
    _subject.sink.add(response);
  }

  void addNewImage() {
    _repository.addNewImage();
  }

  void deleteImage(int index) {
    _repository.deleteImage(index);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<List<ImageModel>> get subject => _subject;
}

final favImagesBloc = FavImagesBloc();
