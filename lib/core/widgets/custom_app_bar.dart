import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({super.key, required String title, super.actions, super.leading})
      : super(
          scrolledUnderElevation: 0,
          title: Text(title),
          centerTitle: true,
          automaticallyImplyLeading: false,
        );
}
