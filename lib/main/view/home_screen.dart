import 'package:flutter/widgets.dart';
import 'package:foseja/common/layout/default_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(child: Text('홈화면'));
  }
}
