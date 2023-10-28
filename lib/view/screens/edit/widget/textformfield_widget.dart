import 'package:flutter/material.dart';

class TextFormFiledWidget extends StatelessWidget {
  const TextFormFiledWidget(
      {super.key,
      required this.title,
      required this.hintText,
      required this.controller,
      this.forgotPasswordEnable = false});

  final String title;
  final String hintText;
  final bool forgotPasswordEnable;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle:
                  const TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 2,
                  color: Colors.red, // Customize the color for the error border
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 2,
                  color: Colors
                      .red, // Customize the color for the focused error border
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'sdfsdfs';
              }
              return null;
            },
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
