import "package:flutter/material.dart";
import 'package:images/bloc/fav_images_bloc.dart';
import 'package:images/models/image_model.dart';
import 'package:images/widgets/empty_list.dart';
import 'package:images/widgets/fav_image_tile.dart';
import 'package:images/widgets/loading_indicator.dart';

class FavImagesScreen extends StatefulWidget {
  const FavImagesScreen({Key key}) : super(key: key);

  @override
  _FavImagesScreenState createState() => _FavImagesScreenState();
}

class _FavImagesScreenState extends State<FavImagesScreen> {
  @override
  void initState() {
    super.initState();
    favImagesBloc.getUserFavImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: <Widget>[
        SizedBox(height: 20.0),
        Expanded(
          child: StreamBuilder<List<ImageModel>>(
              stream: favImagesBloc.subject.stream,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return LoadingIndicator();
                }
                if (snapshot.hasData) {
                  if (snapshot.data == []) {
                    return EmptyList();
                  }
                  return GridView.builder(
                      padding: const EdgeInsets.only(
                          right: 12, left: 12, bottom: 32, top: 8),
                      itemCount: snapshot.data.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemBuilder: (context, index) => FavImageTile(
                            index: index,
                            imageTitle: snapshot.data[index].title.toString(),
                            imageUrl: snapshot.data[index].imageUrl.toString(),
                          ));
                }
                return LoadingIndicator();
              }),
        )
      ],
    )));
  }
}
