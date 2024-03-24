import 'package:flutter/material.dart';
import 'package:flutter_dump_playground/sign_in/view/sign_in_form.dart';
import 'package:gap/gap.dart';
import 'package:moon_design/moon_design.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SignInView();
  }
}

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    const sizes = MoonSizes.sizes;
    const typography = MoonTypography.typography;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(sizes.x2s),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sign in to your account',
                  style: typography.heading.text24,
                ),
                Gap(sizes.xs),
                const SignInForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
