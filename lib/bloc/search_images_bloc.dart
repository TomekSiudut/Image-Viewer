import 'package:images/models/image_model.dart';
import 'package:images/repository/image_repository.dart';
import 'package:rxdart/subjects.dart';

class SearchImagesBloc {
  final ImageRepository _repository = ImageRepository();
  final BehaviorSubject<List<ImageModel>> _subject =
      BehaviorSubject<List<ImageModel>>();

  Future<void> search(String value) async {
    final List<ImageModel> response =
        await _repository.searchImagesByKeyword(value);
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<List<ImageModel>> get subject => _subject;
}

final searchImageBloc = SearchImagesBloc();
