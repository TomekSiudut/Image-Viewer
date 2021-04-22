import "package:flutter/material.dart";
import 'package:images/theme/colors.dart';
import 'package:images/widgets/text_input_container.dart';

class SearchImagesScreen extends StatelessWidget {
  const SearchImagesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bg,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextInputContainer(
                  child: TextField(
                      decoration: InputDecoration(
                          icon: Icon(Icons.search,
                              color: Colors.grey, size: 20.0),
                          hintText: "Search Images..",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          border: InputBorder.none)))
            ],
          ),
        ));
  }
}
