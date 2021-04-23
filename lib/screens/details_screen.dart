import 'package:favorite_button/favorite_button.dart';
import "package:flutter/material.dart";
import 'package:images/bloc/fav_images_bloc.dart';
import 'package:images/models/image_model.dart';
import 'package:images/theme/colors.dart';

class DetailsScreen extends StatelessWidget {
  final ImageModel image;
  const DetailsScreen({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: AppColors.mainColor,
      ),
      body: Stack(children: <Widget>[
        Hero(
          tag: image.id,
          child: Image.network(
            image.imageUrl,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(35.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FavoriteButton(
                valueChanged: (_isFavorite) {
                  favImagesBloc.addNewImage(image);
                },
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
