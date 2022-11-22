// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../contants/constants.dart';

class AppShimmer extends StatefulWidget {
  bool active;
  Widget child;

  AppShimmer({required this.child, this.active = true, Key? key})
      : super(key: key);

  @override
  State<AppShimmer> createState() => _AppShimmer();
}

class _AppShimmer extends State<AppShimmer> {
  @override
  Widget build(BuildContext context) {
    return widget.active == true
        ? Shimmer.fromColors(
            baseColor: Constants.gray.shade100,
            highlightColor: Colors.white,
            child: widget.child,
          )
        : widget.child;
  }
}
