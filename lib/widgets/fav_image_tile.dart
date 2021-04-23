import "package:flutter/material.dart";
import 'package:images/bloc/fav_images_bloc.dart';
import 'package:images/screens/details_screen.dart';

class FavImageTile extends StatelessWidget {
  final String imageUrl;
  final String imageTitle;
  final int index;

  const FavImageTile(
      {Key key,
      @required this.imageUrl,
      @required this.imageTitle,
      @required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailsScreen(
                  imageUrl: imageUrl,
                )),
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Hero(
                    tag: imageUrl,
                    child: Image.network(
                      imageUrl,
                      height: 250.0,
                      width: 200.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              imageTitle,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(width: 8),
                        ],
                      ),
                      SizedBox(height: 2),
                      Text(
                        "image description",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      SizedBox(height: 5),
                      GestureDetector(
                        onTap: () => favImagesBloc.deleteImage(index),
                        child: Text("DELETE",
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
