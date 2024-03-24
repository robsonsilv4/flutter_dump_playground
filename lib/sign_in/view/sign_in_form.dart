import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:moon_design/moon_design.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool _isEmailValid = false;
  bool _isPasswordValid = false;

  void _onEmailValidated(bool isValid) {
    if (isValid == _isEmailValid) return;
    setState(() => _isEmailValid = isValid);
  }

  void _onPasswordValidated(bool isValid) {
    if (isValid == _isPasswordValid) return;
    setState(() => _isPasswordValid = isValid);
  }

  @override
  Widget build(BuildContext context) {
    const sizes = MoonSizes.sizes;
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _EmailInput(onValidated: _onEmailValidated),
          Gap(sizes.x2s),
          _PasswordInput(onValidated: _onPasswordValidated),
          Gap(sizes.xs),
          _SignInButton(enabled: _isEmailValid && _isPasswordValid),
        ],
      ),
    );
  }
}

class _EmailInput extends StatefulWidget {
  const _EmailInput({this.onValidated});

  final ValueChanged<bool>? onValidated;

  @override
  State<_EmailInput> createState() => _EmailInputState();
}

class _EmailInputState extends State<_EmailInput> {
  final _emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  late final _textController = TextEditingController();
  late final _inputFocusNode = FocusNode();
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _textController.addListener(_validate);
  }

  void _validate() {
    if (!_inputFocusNode.hasFocus) return;
    final email = _textController.text;
    if (email.isEmpty) {
      setState(() => _errorText = 'Email is required');
    } else if (!_emailRegExp.hasMatch(email)) {
      setState(() => _errorText = 'Invalid email');
    } else {
      setState(() => _errorText = null);
    }
    widget.onValidated?.call(_errorText == null);
  }

  @override
  Widget build(BuildContext context) {
    return MoonFormTextInput(
      focusNode: _inputFocusNode,
      controller: _textController,
      hintText: 'Email',
      errorText: _errorText,
      leading: const Icon(MoonIcons.mail_email_stats_24_regular),
      textInputSize: MoonTextInputSize.lg,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
  }

  @override
  void dispose() {
    _inputFocusNode.dispose();
    _textController
      ..removeListener(_validate)
      ..dispose();
    super.dispose();
  }
}

class _PasswordInput extends StatefulWidget {
  const _PasswordInput({this.onValidated});

  final ValueChanged<bool>? onValidated;

  @override
  State<_PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<_PasswordInput> {
  static final _passwordRegExp =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

  late final _textController = TextEditingController();
  late final _inputFocusNode = FocusNode();
  bool _visiblePassword = false;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _textController.addListener(_validate);
  }

  void _togglePasswordVisibility() {
    setState(() => _visiblePassword = !_visiblePassword);
  }

  void _validate() {
    if (!_inputFocusNode.hasFocus) return;
    final password = _textController.text;
    if (password.isEmpty) {
      setState(() => _errorText = 'Password is required');
    } else if (!_passwordRegExp.hasMatch(password)) {
      setState(() => _errorText = 'Invalid password');
    } else {
      setState(() => _errorText = null);
    }
    widget.onValidated?.call(_errorText == null);
  }

  @override
  Widget build(BuildContext context) {
    return MoonFormTextInput(
      focusNode: _inputFocusNode,
      controller: _textController,
      hintText: 'Password',
      errorText: _errorText,
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
    );
  }

  @override
  void dispose() {
    _inputFocusNode.dispose();
    _textController
      ..removeListener(_validate)
      ..dispose();
    super.dispose();
  }
}

class _SignInButton extends StatefulWidget {
  const _SignInButton({required this.enabled});

  final bool enabled;

  @override
  State<_SignInButton> createState() => _SignInButtonState();
}

class _SignInButtonState extends State<_SignInButton> {
  @override
  Widget build(BuildContext context) {
    return MoonFilledButton(
      width: double.maxFinite,
      label: const Text('Sign In'),
      onTap: widget.enabled
          ? () => MoonToast.show(
                context,
                label: const Text('Home is not implemented yet!'),
              )
          : null,
    );
  }
}
