import "package:flutter/material.dart";
import 'package:images/widgets/image_tile.dart';

class SearchImagesScreen extends StatelessWidget {
  const SearchImagesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: ImageTile()));
  }
}
