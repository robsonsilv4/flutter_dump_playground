import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:moon_design/moon_design.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    const sizes = MoonSizes.sizes;
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const _EmailInput(),
          Gap(sizes.x2s),
          MoonFormTextInput(
            textInputSize: MoonTextInputSize.lg,
            hintText: 'Password',
          ),
          Gap(sizes.xs),
          const _SignInButton(),
        ],
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput();

  static final _emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  @override
  Widget build(BuildContext context) {
    return MoonFormTextInput(
      hintText: 'Email',
      textInputSize: MoonTextInputSize.lg,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: _validateEmail,
    );
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!_emailRegExp.hasMatch(value)) {
      return 'Invalid email';
    }
    return null;
  }
}

class _SignInButton extends StatelessWidget {
  const _SignInButton();

  @override
  Widget build(BuildContext context) {
    return MoonFilledButton(
      width: double.maxFinite,
      label: const Text('Sign In'),
      onTap: () {
        if (Form.of(context).validate()) {
          MoonToast.show(
            context,
            label: const Text('Home is not implemented yet!'),
          );
        }
      },
    );
  }
}
