import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ImageNetwork extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  ImageNetwork({
    Key? key,
    required this.url,
    required this.width,
    required this.height,
    this.onPressed,
  }) : super(key: key);

  final String url;
  final double width;
  final double height;
  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    if (url.isNotEmpty) {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: CachedNetworkImage(
          imageUrl: url,
          fit: BoxFit.cover,
          placeholder: (_, __) {
            return Center(child: CupertinoActivityIndicator(radius: 20.h));
          },
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      );
    } else {
      return Opacity(
          opacity: 0.8,
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Image.asset(
              'assets/images/ecualizadorcuadrao.webp',
              fit: BoxFit.cover,
            ),
          ));
    }
  }
}
