import "package:flutter/material.dart";

class EmptyList extends StatelessWidget {
  final Widget child;

  const EmptyList({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        Icon(Icons.close, color: Colors.grey, size: 35.0),
        Text("No images found", style: TextStyle(color: Colors.black))
      ],
    ));
  }
}
