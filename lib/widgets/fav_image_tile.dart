import "package:flutter/material.dart";
import 'package:images/bloc/fav_images_bloc.dart';
import 'package:images/models/image_model.dart';
import 'package:images/screens/details_screen.dart';

class FavImageTile extends StatelessWidget {
  final ImageModel image;

  const FavImageTile({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailsScreen(
                  image: image,
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
                    tag: image.id,
                    child: Image.network(
                      image.imageUrl ?? "",
                      height: 250.0,
                      width: 200.0,
                      fit: BoxFit.cover,
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
                              image.title ?? "Image from Unsplash",
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(width: 8),
                        ],
                      ),
                      SizedBox(height: 2.0),
                      SizedBox(height: 5.0),
                      Center(
                        child: TextButton(
                          onPressed: () => favImagesBloc.deleteImage(image.id),
                          child: Text("REMOVE",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 15.0)),
                        ),
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
