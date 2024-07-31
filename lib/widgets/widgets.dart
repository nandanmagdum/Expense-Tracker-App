import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Widgets {
  static Widget appButton({required String name, required Function function}) =>
      GestureDetector(
        onTap: () {
          function();
        },
        child: Container(
          height: Get.height * 0.1,
          width: Get.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.grey[900]),
          child: Center(
            child: Text(
              name,
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      );

  static Widget formField({
    required String hint,
    required TextEditingController controller,
    required bool isNumber,
    required String title
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          SizedBox(height: Get.height*0.01),
          TextFormField(
            keyboardType: isNumber ? TextInputType.number : null,
            inputFormatters: isNumber?  [FilteringTextInputFormatter.digitsOnly] : null,
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(height: Get.height*0.03,),
        ],
      );
}
