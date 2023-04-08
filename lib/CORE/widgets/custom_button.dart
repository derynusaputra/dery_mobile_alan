import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

import '../constant.dart';

class CustomFieldButton extends StatelessWidget {
  final String title;
  final double width;
  final double height;

  final VoidCallback? onPress;

  const CustomFieldButton(
      {Key? key,
      required this.title,
      this.width = double.infinity,
      required this.height,
      this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPress,
        child: Text(title, style: t16w500.copyWith(color: whiteColor)),
        style: ElevatedButton.styleFrom(
            primary: purpleColor, shape: StadiumBorder()),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPress;

  const CustomTextButton({Key? key, required this.title, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Text(title, style: t16w500.copyWith(color: greyDarkColor)),
    );
  }
}

class CustomButtonLogin extends StatelessWidget {
  final String img;
  final String title;
  final double width;
  final double height;
  final VoidCallback? onPress;

  const CustomButtonLogin(
      {Key? key,
      required this.title,
      this.onPress,
      required this.img,
      this.width = double.infinity,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        width: width,
        child: ElevatedButton.icon(
          onPressed: onPress,
          icon: Image.asset(
            img,
            height: 20.h,
          ), //icon data for elevated button
          label: Text(
            "      ${title}",
            style: t12w500,
          ), //label text
          style: ElevatedButton.styleFrom(
              primary: whiteColor, elevation: 0, shape: StadiumBorder()),
        ));
  }
}
