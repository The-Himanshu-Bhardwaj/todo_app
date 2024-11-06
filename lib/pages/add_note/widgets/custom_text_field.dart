import 'package:flutter/material.dart';
import '../../../util/app_colors.dart';
import '../../../util/strings.dart';

class CustomTextFields extends StatelessWidget {
  const CustomTextFields({super.key, required this.hint, required this.icon, required this.controller, required this.focusNode});

  final String hint;
  final IconData icon;
  final FocusNode focusNode;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 30, 10, 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(AppColors.GREY),
      ),
      child: TextField(
          textInputAction: TextInputAction.next,
          maxLines: 1,
          maxLength: 100,
          focusNode: focusNode,
          controller: controller,
          style: const TextStyle(fontFamily: SANS_BOLD, fontSize: 15, color: Color(AppColors.RICH_BLACK)),
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(14),
              errorText: null,
              hintText: '',
              hintStyle: const TextStyle(color: Colors.black38, fontSize: 14),
              counterText: '',
              prefixIcon: Icon(
                icon,
                size: 18,
                color: Colors.black38,
              ),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none
              ),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none
              )
          )),
    );
  }
}