import "package:flutter/material.dart";

class TextInputContainer extends StatelessWidget {
  final Widget child;

  const TextInputContainer({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50.0,
        margin: EdgeInsets.only(left: 10.0, right: 10.0),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
        child: child);
  }
}
