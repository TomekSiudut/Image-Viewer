import "package:flutter/material.dart";
import 'package:images/theme/colors.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: AppColors.mainColor,
      ),
    );
  }
}
