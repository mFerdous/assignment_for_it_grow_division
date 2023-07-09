import 'package:flutter/material.dart';

class BottomSheetItem extends StatelessWidget {
  final String text;
  final Function(String) onItemTap;

  const BottomSheetItem({
    Key? key,
    required this.text,
    required this.onItemTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          InkWell(
            onTap: () => onItemTap(text),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              width: double.infinity,
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
              ),
            ),
          ),
          Container(
            color: const Color(0xFFBBBBBB),
            height: 0.5,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
