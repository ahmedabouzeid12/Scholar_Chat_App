import 'package:flutter/material.dart';

class CustomFormTextFiled extends StatelessWidget {
  CustomFormTextFiled({this.onChange, this.hintText,required this.obscureText});
   String? hintText;
   bool? obscureText;
   Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      validator: (data)
      {
        if(data!.isEmpty)
        {
          return 'field is required';
        }
      },
      onChanged: onChange,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.white,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
