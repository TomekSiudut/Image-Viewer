import "dart:async";

enum NavBarPage { HOME, FAV }

class BottomNavBarBloc {
  final StreamController<NavBarPage> _navBarController =
      StreamController<NavBarPage>.broadcast();

  NavBarPage defaultPage = NavBarPage.HOME;

  Stream<NavBarPage> get pageStream => _navBarController.stream;

  void choosePage(int i) {
    switch (i) {
      case 0:
        _navBarController.sink.add(NavBarPage.HOME);
        break;
      case 1:
        _navBarController.sink.add(NavBarPage.FAV);
    }
  }

  close() {
    _navBarController?.close();
  }
}
