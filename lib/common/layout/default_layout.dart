import 'package:flutter/material.dart';
import 'package:foseja/common/const/colors.dart';

class DefaultLayout extends StatelessWidget {
  final Widget child;
  const DefaultLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: BACKGROUND_COLOR,
        body: child,
      ),
    );
  }
}
