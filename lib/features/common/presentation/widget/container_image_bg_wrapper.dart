import 'package:flutter/material.dart';
import 'package:test_task/core/resources/export_resources.dart';

class ContainerImageBgWrapper extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry paddingOuter;
  final EdgeInsetsGeometry paddingInner;

  const ContainerImageBgWrapper({
    super.key,
    required this.child,
    this.paddingOuter = const EdgeInsets.all(15.0),
    this.paddingInner = const EdgeInsets.all(20.0),
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: paddingOuter,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            StringRes.kImgPathAppBg,
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Container(
        padding: paddingInner,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white.withOpacity(0.75),
        ),
        child: child,
      ),
    );
  }
}
