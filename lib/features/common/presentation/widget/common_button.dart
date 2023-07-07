import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback? onPressed;

  CommonButton({required this.buttonName, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.0,
      width: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color(0xff3B6491),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Text(
          buttonName,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
