import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

import '../constant.dart';

class CustomForm extends StatelessWidget {
  final String? title;
  final bool? titleFalse;
  final bool disable;

  final String? label;
  final String? hintText;

  final bool obscureText;
  final TextInputType inputType;

  final TextEditingController? formCon;
  final String? Function(String?)? validator;
  final Widget? suffixIcons;
  final Widget? prefixIcon;

  final double? radius;
  final TextInputAction? textinputaction;
  final Color? backColor;
  final List<TextInputFormatter> inputFormatters;
  final Function(String)? onsubmit;

  const CustomForm(
      {Key? key,
      this.inputFormatters = const [],
      this.title = '',
      this.titleFalse = true,
      this.disable = false,
      this.label,
      this.hintText,
      this.inputType = TextInputType.text,
      this.textinputaction,
      this.obscureText = false,
      this.formCon,
      this.onsubmit,
      this.suffixIcons,
      this.prefixIcon,
      this.validator,
      this.backColor = const Color(0xffF6F8FB),
      this.radius = 14})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleFalse == true ? Text(title!, style: t14w500) : SizedBox(),
        SizedBox(
          height: 8.h,
        ),
        TextFormField(
          inputFormatters: [],
          textInputAction: textinputaction,
          readOnly: disable,
          // autofocus: disable,
          // enableInteractiveSelection: false,
          obscureText: obscureText,
          controller: formCon,
          validator: validator,
          keyboardType: inputType,
          onFieldSubmitted: (value) {
            print("${value} search");
          },
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: backColor!),
                borderRadius: BorderRadius.circular(radius!.r),
              ),
              prefixIcon: prefixIcon,
              // helperText: 'dert',
              hintText: hintText,
              // isCollapsed: true,
              labelText: label,
              filled: true,
              fillColor: backColor,
              contentPadding: EdgeInsets.all(12.h),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: lightBGColor),
                borderRadius: BorderRadius.circular(radius!.r),
              ),
              suffixIcon: suffixIcons),
        ),
      ],
    );
  }
}

class CustomForms extends StatelessWidget {
  final bool disable;

  final String? label;
  final String? hintText;

  final bool obscureText;
  final TextInputType inputType;

  final TextEditingController? formCon;
  final String? Function(String?)? validator;
  final Widget? suffixIcons;
  final Widget? prefixIcon;
  final double? radius;
  final TextInputAction? textinputaction;
  final Color? backColor;
  final Color? borderColor;
  final FocusNode? focus;

  final Function(String)? onsubmit;

  const CustomForms(
      {Key? key,
      this.disable = false,
      this.label,
      this.hintText,
      this.inputType = TextInputType.text,
      this.textinputaction,
      this.obscureText = false,
      this.formCon,
      this.onsubmit,
      this.suffixIcons,
      this.prefixIcon,
      this.validator,
      this.backColor = const Color(0xffFFFFFF),
      this.borderColor = const Color(0xffFFFFFF),
      this.focus,
      this.radius = 14})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textinputaction,
      readOnly: disable,
      // autofocus: disable,
      // enableInteractiveSelection: false,
      obscureText: obscureText,
      controller: formCon,
      validator: validator,
      keyboardType: inputType,
      onFieldSubmitted: (value) {
        print("${value} search");
      },

      focusNode: focus,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor!),
            borderRadius: BorderRadius.circular(radius!.r),
          ),
          prefixIcon: prefixIcon,
          // helperText: 'dert',
          hintText: hintText,
          // isCollapsed: true,
          labelText: label,
          filled: true,
          fillColor: backColor,
          contentPadding: EdgeInsets.all(5.h),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: redColor),
            borderRadius: BorderRadius.circular(radius!.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor!),
            borderRadius: BorderRadius.circular(radius!.r),
          ),
          suffixIcon: suffixIcons),
    );
  }
}
