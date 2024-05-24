import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../view_model/utils/colors.dart';
import '../../view_model/utils/fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.backgroundColor,
    this.fontFamily,
    this.padding,
    this.margin,
    this.fontSize,
    this.fontWeight,
    this.width,
    this.borderRadius,
    this.style,
    this.border = true,
  });
  final String text;
  final VoidCallback onTap;
  final String? fontFamily;
  final Color? backgroundColor;
  final double? fontSize;
  final FontWeight? fontWeight;

  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final BorderRadiusGeometry? borderRadius;
  final TextStyle? style;
  final bool border;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      child: Container(
        margin: margin,
        width: width ?? MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: backgroundColor ?? AppColor.primary,
            borderRadius: borderRadius ??
                BorderRadius.circular(
                  50.0,
                ),
            border:
                border ? Border.all(width: 1, color: AppColor.black) : null),
        child: Center(
          child: Padding(
            padding: padding ??
                const EdgeInsets.only(
                  top: 11.0,
                  bottom: 11.0,
                ),
            child: Text(
              text,
              style: style ??
                  TextStyle(
                    color: AppColor.white,
                    fontWeight: fontWeight,
                    fontSize: fontSize,
                    fontFamily: AppFontFamily.appFont,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}

class Buttonoutlined extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final VoidCallback onPressed;
  final TextStyle? style;
  const Buttonoutlined({
    super.key,
    required this.buttonText,
    required this.buttonColor,
    required this.onPressed,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: sizewidth(context) * .9,
      height: sizeHeight(context) * .07,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: buttonColor,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.r),
          ),
        ),
        onPressed: onPressed,
        child: Text(buttonText,
            style: style ??
                Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontFamily: AppFontFamily.appFont,
                    color: buttonColor,
                    fontWeight: FontWeight.w500)),
      ),
    );
  }
}
