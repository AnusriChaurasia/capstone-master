import 'package:flutter/material.dart';
import 'package:capstone/components/text_field_container.dart';
import 'package:capstone/Shared/constants.dart';
//import 'package:validators/validators.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        // ignore: missing_return
        validator: (value) {
      // add your custom validation here.
          if (value.isEmpty) {
            return 'Please enter some text';
          }
          if (value.length <= 8) {
            return 'Must be more than 8 charater';
          }
        },
        obscureText: true,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
