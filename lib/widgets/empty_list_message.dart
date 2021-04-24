import "package:flutter/material.dart";

class EmptyListMessage extends StatelessWidget {
  final Widget child;
  final String title;
  final IconData icon;
  const EmptyListMessage({Key key, this.child, this.title, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, color: Colors.grey, size: 50.0),
        SizedBox(height: 10.0),
        Text(title,
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold))
      ],
    ));
  }
}
