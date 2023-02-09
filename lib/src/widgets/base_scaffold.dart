import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget {
  final Widget body;
  final AppBar? appBar;
  final String? imagePath;

  const BaseScaffold({
    Key? key,
    this.appBar,
    required this.body,
    this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: imagePath != null
            ? BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath!),
                  fit: BoxFit.cover,
                ),
              )
            : null,
        child: SafeArea(bottom: false, child: body),
      ),
    );
  }
}
