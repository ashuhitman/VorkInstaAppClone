import 'package:flutter/material.dart';
import 'package:vorkinsta/values/app_colors.dart';
import 'package:vorkinsta/values/app_strings.dart';

class SubscribeEditField extends StatefulWidget {
  const SubscribeEditField({Key? key}) : super(key: key);

  @override
  State<SubscribeEditField> createState() => _SubscribeEditFieldState();
}

class _SubscribeEditFieldState extends State<SubscribeEditField> {
  final TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = new FocusNode();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 30,
      width: MediaQuery.of(context).size.width * 0.65,
      child: TextField(
        controller: _controller,
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(fontSize: 12),
        decoration: InputDecoration(
            border: const OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: AppColors.blue),
                borderRadius: BorderRadius.all(Radius.circular(0))),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: AppColors.blue),
                borderRadius: BorderRadius.all(Radius.circular(0))),
            contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            hintText: "Enter your email address",
            hintStyle: const TextStyle(color: AppColors.blue),
            suffixIcon: Padding(
              padding: const EdgeInsets.all(0.0),
              child: MaterialButton(
                onPressed: () {},
                color: AppColors.sbBtnColor,
                child: const Text(
                  AppStrings.subscribeText,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
