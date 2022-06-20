import 'package:flutter/material.dart';
import 'package:movie_app/presentation/theme/theme_color.dart';
import 'package:movie_app/presentation/theme/theme_text.dart';

class TabTitleWidget extends StatelessWidget {
  final String title;
  final Function onTap;
  final bool isSelected;

  const TabTitleWidget(
      {Key? key,
      required this.title,
      required this.onTap,
      required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> onTap(),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? AppColor.royalBlue : Colors.transparent,
            ),
          ),
        ),
        child: Text(
          title,
          style: isSelected
              ? Theme.of(context).textTheme.royalBlueSubtitle1
              : Theme.of(context).textTheme.subtitle1,
        ),
      ),
    );
  }
}
