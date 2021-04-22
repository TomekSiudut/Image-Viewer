import "package:flutter/material.dart";

class EmptyList extends StatelessWidget {
  final Widget child;
  const EmptyList({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.image, color: Colors.grey, size: 50.0),
        SizedBox(height: 10.0),
        Text("No images found :(",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold))
      ],
    ));
  }
}
