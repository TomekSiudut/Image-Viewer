import "package:flutter/material.dart";
import 'package:images/bloc/newest_images_bloc.dart';
import 'package:images/bloc/search_images_bloc.dart';
import 'package:images/theme/colors.dart';
import 'package:images/widgets/image_tile.dart';
import 'package:images/widgets/loading_indicator.dart';
import 'package:images/widgets/text_input_container.dart';

class SearchImagesScreen extends StatefulWidget {
  const SearchImagesScreen({Key key}) : super(key: key);

  @override
  _SearchImagesScreenState createState() => _SearchImagesScreenState();
}

class _SearchImagesScreenState extends State<SearchImagesScreen> {
  final _searchInputController = TextEditingController();
  @override
  void initState() {
    super.initState();
    newestImagesBloc.getNewestImages();
  }

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
                      controller: _searchInputController,
                      onChanged: (changed) {
                        searchImageBloc
                            .search(_searchInputController.text.toLowerCase());
                        setState(() {});
                      },
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
                child: StreamBuilder(
                    stream: _searchInputController.value.text.isEmpty
                        ? newestImagesBloc.subject.stream
                        : searchImageBloc.subject.stream,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        print("error");
                      }
                      if (snapshot.hasData) {
                        return GridView.builder(
                            padding: const EdgeInsets.only(
                                right: 12, left: 12, bottom: 32, top: 8),
                            itemCount: snapshot.data.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.7,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                            ),
                            itemBuilder: (context, index) => ImageTile(
                                  imageTitle:
                                      snapshot.data[index].title.toString(),
                                  imageUrl:
                                      snapshot.data[index].imageUrl.toString(),
                                ));
                      }
                      return LoadingIndicator();
                    }),
              )
            ],
          ),
        ));
  }
}
