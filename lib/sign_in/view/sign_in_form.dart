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
          MoonFormTextInput(
            textInputSize: MoonTextInputSize.lg,
            hintText: 'Email',
          ),
          Gap(sizes.x2s),
          MoonFormTextInput(
            textInputSize: MoonTextInputSize.lg,
            hintText: 'Password',
          ),
          Gap(sizes.xs),
          MoonFilledButton(
            width: double.maxFinite,
            label: const Text('Sign In'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
