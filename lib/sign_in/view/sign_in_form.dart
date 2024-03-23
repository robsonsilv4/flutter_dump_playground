import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:moon_design/moon_design.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    const sizes = MoonSizes.sizes;
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const _EmailInput(),
          Gap(sizes.x2s),
          const _PasswordInput(),
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
      leading: const Icon(MoonIcons.mail_email_stats_24_regular),
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

class _PasswordInput extends StatefulWidget {
  const _PasswordInput();

  @override
  State<_PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<_PasswordInput> {
  static final _passwordRegExp =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

  bool _visiblePassword = false;

  void _togglePasswordVisibility() {
    setState(() {
      _visiblePassword = !_visiblePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MoonFormTextInput(
      hintText: 'Password',
      leading: const Icon(MoonIcons.security_password_24_regular),
      obscureText: !_visiblePassword,
      textInputSize: MoonTextInputSize.lg,
      textInputAction: TextInputAction.done,
      trailing: GestureDetector(
        onTap: _togglePasswordVisibility,
        child: _visiblePassword
            ? const Icon(MoonIcons.controls_eye_crossed_24_light)
            : const Icon(MoonIcons.controls_eye_24_light),
      ),
      validator: _validatePassword,
    );
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (!_passwordRegExp.hasMatch(value)) {
      return 'Invalid password';
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
        } else {
          MoonToast.show(
            context,
            variant: MoonToastVariant.inverted,
            label: const Text('Form is invalid!'),
          );
        }
      },
    );
  }
}
