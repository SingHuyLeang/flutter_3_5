import 'package:flutter/material.dart';
import 'package:shoes_app/ui/components/widgets/text.dart';
import 'package:shoes_app/ui/screens/app.dart';
import 'package:shoes_app/ui/theme/colors.dart';
import 'package:shoes_app/ui/theme/type.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/discover.jpg'),
        ),
      ),
      padding: const EdgeInsets.only(left: 32,right: 16,bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SText(
            text: "Discover",
            size: 28,
            space: 1.3,
            font: Font.bold,
            color: SColors.light,
          ),
          const SizedBox(height: 15),
          const SText(
            text: "The best and comfortable\nsutible shoes just\nfor you",
            color: SColors.light,
            size: 14,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const App(),
                ),
              ),
              icon: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: SColors.light,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
