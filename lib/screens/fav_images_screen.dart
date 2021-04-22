import "package:flutter/material.dart";
import 'package:images/widgets/image_tile.dart';

class FavImagesScreen extends StatelessWidget {
  const FavImagesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: <Widget>[
        SizedBox(height: 20.0),
        Expanded(
          child: GridView.builder(
              padding: const EdgeInsets.only(
                  right: 12.0, left: 12.0, bottom: 32.0, top: 8.0),
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) => ImageTile()),
        )
      ],
    )));
  }
}
