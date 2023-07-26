import 'package:flutter/material.dart';

import '../../../../core/resources/export_resources.dart';
import '../../../../core/utils/lang/size_config.dart';
import 'bottom_sheet_item.dart';

showAppModalBottomSheet({
  required BuildContext context,
  required String title,
  required List<dynamic> items,
  required ValueChanged<String> onItemSelected,
  ValueChanged<String>? onItemSelected2,
}) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: StyleRes.kBottomSheetRadius,
      isScrollControlled: true,
      builder: (context) {
        return AppBottomSheet(
          title: title,
          items: items,
          onValueChange: (value) {
            Navigator.pop(context);
            onItemSelected(value);
            onItemSelected2!(value);
          },
        );
      });
}

class AppBottomSheet extends StatelessWidget {
  final String title;
  final List<dynamic> items;
  final ValueChanged<String> onValueChange;

  const AppBottomSheet({
    Key? key,
    required this.title,
    required this.items,
    required this.onValueChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isExpand = items.length > 7;


    return isExpand
        ? SizedBox(
            height:
                getProportionateScreenHeight(SizeConfig.screenHeight * 0.70),
            child: ListView(
              children: [
                ..._buildBottomSheetItems(items),
              ],
            ),
          )
        : Wrap(
            children: [
              ..._buildBottomSheetItems(items),
            ],
          );
  }

  List<Widget> _buildBottomSheetItems(List<dynamic> list) {
    return list
        .map((e) => BottomSheetItem(
              text: e,
              onItemTap: (value) {
                onValueChange(value);
              },
            ))
        .toList();
  }
}
