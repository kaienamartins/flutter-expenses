import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeTextfield extends StatelessWidget {
  const AdaptativeTextfield(
      {super.key,
      this.label,
      this.onSubmitted,
      this.controller,
      this.keyboardType = TextInputType.text});

  final String? label;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CupertinoTextField(
                controller: controller,
                keyboardType: keyboardType,
                onSubmitted: onSubmitted,
                padding:
                    const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
                placeholder: label),
          )
        : TextField(
            controller: controller,
            keyboardType: keyboardType,
            onSubmitted: onSubmitted,
            decoration: InputDecoration(
              labelText: label,
            ),
          );
  }
}
