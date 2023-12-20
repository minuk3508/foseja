import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foseja/common/const/colors.dart';
import 'package:foseja/common/layout/default_layout.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 10,
            ),
            child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icons/edit_icon.svg',
                  width: 25,
                  height: 25,
                )),
          )
        ],
        backgroundColor: BACKGROUND_COLOR,
        centerTitle: true,
      ),
      backgroundColor: BACKGROUND_COLOR,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 20,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 242, 165, 31)
                        .withOpacity(0.3),
                    spreadRadius: 8,
                    blurRadius: 20,
                    offset: const Offset(0, 7), // 쉐도우 위치 조정 가능
                  ),
                ],
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    width: 80,
                    height: 80,
                    'assets/images/emoji_lion_17.png',
                  ),
                  const Text(
                    '김민욱',
                    style: TextStyle(
                      color: DEFAULT_TEXT_COLOR,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text('@user-EFjgx9vdjgna'),
                ],
              )),
        ),
      ),
    );
  }
}
