import "package:flutter/material.dart";
import 'package:images/theme/colors.dart';
import 'package:images/widgets/image_tile.dart';
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
                          border: InputBorder.none))),
              SizedBox(height: 30.0),
              Expanded(
                child: GridView.builder(
                    padding: const EdgeInsets.only(
                        right: 12, left: 12, bottom: 32, top: 8),
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
          ),
        ));
  }
}
