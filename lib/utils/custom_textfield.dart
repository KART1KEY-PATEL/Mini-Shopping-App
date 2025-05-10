import 'package:flutter/material.dart';
import 'package:mini_shopping_app/utils/color.dart';
import 'package:mini_shopping_app/utils/text_util.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.validate = false,
    this.validatorText = "",
    required this.maxLines,
    this.title = "",
    this.obsureText = false,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
  });
  String hintText;
  TextEditingController controller;
  bool validate;
  int maxLines;
  String title;
  bool obsureText;
  String validatorText;
  TextInputType keyboardType;
  Icon? prefixIcon;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    double sH = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.title.length != 0
            ? txt(
              widget.title,
              size: sH * 0.018,
              color: AppColors.primaryTextColor,
            )
            : SizedBox(),
        // SizedBox(height: sH * 0.008),
        TextField(
          obscureText: _passwordVisible,
          controller: widget.controller,
          maxLines: widget.maxLines,
          keyboardType: widget.keyboardType,
          textAlignVertical: TextAlignVertical.top,
          decoration: InputDecoration(
            prefixIcon: widget.prefixIcon ?? null,
            hintText: widget.hintText,
            suffix:
                widget.obsureText
                    ? InkWell(
                      onTap: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                      child: Container(
                        child: Icon(
                          _passwordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Theme.of(context).primaryColorDark,
                        ),
                      ),
                    )
                    : null,
            alignLabelWithHint: true,
            errorText: widget.validate ? null : widget.validatorText,
          ),
        ),
      ],
    );
  }
}
