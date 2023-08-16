import 'package:bookly_app/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

void customSnackBar(context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Row(
        children: [
          const Icon(Icons.error,color: Colors.red,),
          const SizedBox(width: AppSize.s10,),
          Expanded(child: Text(text)),
        ],
      )));
}