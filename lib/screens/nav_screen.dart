import "package:flutter/material.dart";
import 'package:images/bloc/bottom_nav_bloc.dart';
import 'package:images/repository/image_repository.dart';
import 'package:images/screens/fav_images_screen.dart';
import 'package:images/screens/search_images_screen.dart';
import 'package:images/theme/colors.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  BottomNavBarBloc _bottomNavBarBloc;

  @override
  void initState() {
    super.initState();
    _bottomNavBarBloc = BottomNavBarBloc();
  }

  @override
  Widget build(BuildContext context) {
    ImageRepository().getNewImages();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title:
            Text("Image Viewer", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(
        child: StreamBuilder<NavBarPage>(
          stream: _bottomNavBarBloc.pageStream,
          initialData: _bottomNavBarBloc.defaultPage,
          builder: (BuildContext context, AsyncSnapshot<NavBarPage> snapshot) {
            switch (snapshot.data) {
              case NavBarPage.HOME:
                return SearchImagesScreen();
              case NavBarPage.FAV:
                return FavImagesScreen();
            }
            return Container();
          },
        ),
      ),
      bottomNavigationBar: StreamBuilder(
          stream: _bottomNavBarBloc.pageStream,
          initialData: _bottomNavBarBloc.defaultPage,
          builder: (BuildContext context, AsyncSnapshot<NavBarPage> snapshot) {
            return Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: BottomNavigationBar(
                backgroundColor: Colors.white,
                iconSize: 25.0,
                unselectedItemColor: AppColors.lightTextColor,
                fixedColor: AppColors.mainColor,
                currentIndex: snapshot.data.index,
                onTap: _bottomNavBarBloc.choosePage,
                items: [
                  BottomNavigationBarItem(
                      label: "Search",
                      icon: Icon(Icons.search, color: Colors.grey),
                      activeIcon:
                          Icon(Icons.search, color: AppColors.mainColor)),
                  BottomNavigationBarItem(
                      label: "Favorites",
                      icon: Icon(Icons.favorite, color: Colors.grey),
                      activeIcon:
                          Icon(Icons.favorite, color: AppColors.mainColor))
                ],
              ),
            );
          }),
    );
  }
}
