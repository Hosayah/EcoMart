import 'package:flutter/material.dart';

import '../../../../../utils/constants/text_strings.dart';

class SignupTitle extends StatelessWidget {
  const SignupTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(TTexts.signupTitle, style: Theme.of(context).textTheme.headlineMedium);
  }
}