import 'package:flutter/material.dart';

import '../../components/widgets/text.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      child: const SText(
        text: "Page Profile",
        size: 30,
      ),
    );
  }
}
