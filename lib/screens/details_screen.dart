import "package:flutter/material.dart";
import 'package:images/bloc/fav_images_bloc.dart';
import 'package:images/theme/colors.dart';

class DetailsScreen extends StatelessWidget {
  final String imageUrl;
  const DetailsScreen({Key key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
      ),
      body: Stack(children: <Widget>[
        Hero(
          tag: imageUrl,
          child: Image.network(
            imageUrl,
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
              GestureDetector(
                onTap: () => favImagesBloc.addNewImage(),
                child: Icon(
                  Icons.favorite_border_outlined,
                  color: Colors.white,
                  size: 35.0,
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
