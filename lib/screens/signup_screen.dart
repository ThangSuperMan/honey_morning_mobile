import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:honey_morning_mobile/screens/login_screen.dart';
import 'package:honey_morning_mobile/utils/colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  FocusNode focusNode = FocusNode();
  Color labelTextColor = Colors.grey;
  Color borderColor = Colors.grey;

  void handlePressLoginLink() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    const double horizontalPadding = 20;
    const int bothSideOfScreen = 2;
    const double totalHorizontalPadding = horizontalPadding * bothSideOfScreen;
    double screenWidth =
        MediaQuery.of(context).size.width - totalHorizontalPadding;

    void handleSaveForm() {
      final bool isValid = formKey.currentState!.validate();
      if (isValid) {
        if (kDebugMode) {
          print('Got a valid input');
        }
      }
    }

    Color getLabelTextColor(dynamic isValid) {
      isValid ??= formKey.currentState!.validate();
      return isValid ? primaryColor : errorFieldColor;
    }

    Color getBorderColor(dynamic isValid) {
      isValid ??= formKey.currentState!.validate();
      return isValid ? primaryColor : errorFieldColor;
    }

    void handleTextFormFieldFocusChange(bool hasFocus) {
      setState(() {
        final bool isFormValid = formKey.currentState!.validate();
        if (hasFocus) {
          labelTextColor = getLabelTextColor(isFormValid);
          borderColor = getBorderColor(isFormValid);
          return;
        }

        labelTextColor = isFormValid ? Colors.grey : errorFieldColor;
        borderColor = isFormValid ? Colors.grey : errorFieldColor;
      });
    }

    void handleTextFormFieldValueChange() {
      setState(() {
        final bool isFormValid = formKey.currentState!.validate();
        labelTextColor = getLabelTextColor(isFormValid);
        borderColor = getBorderColor(isFormValid);
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: 40,
        ),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Row(
              children: [
                Text(
                  'Đăng ký',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Form(
              key: formKey,
              child: Focus(
                onFocusChange: (hasFocus) =>
                    handleTextFormFieldFocusChange(hasFocus),
                child: TextFormField(
                  focusNode: focusNode,
                  onChanged: (text) {
                    handleTextFormFieldValueChange();
                  },
                  validator: (value) {
                    if (value != null && value.trim().length < 6) {
                      return 'Mật khẩu phải có tối thiểu 6 ký tự';
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Nhập mật khẩu',
                    labelStyle: TextStyle(
                      color: labelTextColor,
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: primaryColor,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: getBorderColor(null),
                      ),
                    ),
                    border: const OutlineInputBorder(),
                    errorStyle: TextStyle(color: getLabelTextColor(null)),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: errorFieldColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: handleSaveForm,
              icon: const Icon(Icons.save),
              label: const Text('Save'),
            ),
            Row(
              children: [
                const Text(
                  'Bạn đã có tài khoảng?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    handlePressLoginLink();
                  },
                  child: const Text(
                    'Đăng nhập',
                    style: TextStyle(
                      color: secondaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
            const Expanded(
              child: SizedBox(),
            ),
            Row(
              children: [
                Container(
                  width: screenWidth,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(45),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                    child: Center(
                      child: Text(
                        'Tiếp tục',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
