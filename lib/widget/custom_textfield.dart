import 'package:driver_app/constant/app_color.dart';
import 'package:driver_app/constant/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String? hintText;
  final TextInputType? textInputType;
  final Widget? preFixWidget;
  final Widget? suffixFixWidget;
  final int? maxLength;
  final bool? readOnly;
  final bool? enable;
  final bool? obscureText;
  final int? maxLine;
  final Function()? onTap;
  final Function(String)? onChange;
  final double? paddingHorizontal;
  final double? radius;
  final String? Function(String?)? validator;
  final AutovalidateMode? autoValidateMode;

  const CustomTextField({
    super.key,
    this.textEditingController,
    this.hintText,
    this.textInputType,
    this.suffixFixWidget,
    this.preFixWidget,
    this.maxLength,
    this.readOnly,
    this.enable,
    this.onTap,
    this.onChange,
    this.paddingHorizontal,
    this.radius,
    this.validator,
    this.autoValidateMode,
    this.maxLine,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(
            child: TextFormField(
              controller: textEditingController,
              keyboardType: textInputType,
              maxLines: maxLine ?? 1,
              showCursor: true,
              enabled: enable ?? true,
              textCapitalization: TextCapitalization.words,
              readOnly: readOnly ?? false,
              textInputAction: TextInputAction.next,
              cursorColor: Colors.black,
              obscureText: obscureText ?? false,
              maxLength: maxLength,
              onChanged: onChange,
              style: AppTextStyle.textStyleRegular14
                  .copyWith(letterSpacing: maxLength == 10 ? 2.0 : 1.0),
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColor.hintColor),
                      borderRadius: BorderRadius.circular(8)),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColor.hintColor),
                      borderRadius: BorderRadius.circular(8)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColor.hintColor),
                      borderRadius: BorderRadius.circular(8)),
                  hintStyle:
                  const TextStyle(color: AppColor.hintColor, fontSize: 12),
                  hintText: hintText,
                  errorStyle: const TextStyle(height: 0.01),
                  counterText: ""),
              onTap: onTap,
              validator: validator,
              autovalidateMode: autoValidateMode,
            )),

      ],
    );
  }
}
