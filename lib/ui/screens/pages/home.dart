import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shoes_app/data/banner.dart';
import 'package:shoes_app/ui/components/widgets/text.dart';
import 'package:shoes_app/ui/theme/colors.dart';
import 'package:shoes_app/ui/theme/type.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SColors.light,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 30,
              color: SColors.primary,
            ),
            const SizedBox(width: 16),
            const SText(
              text: 'Shoes App',
              font: Font.bold,
              size: 20,
              color: SColors.primary,
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          // text field
          Container(
            width: double.infinity,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.only(
              top: 20,
              left: 16,
              right: 16,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26),
              color: Colors.white,
            ),
            child: const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search',
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          // slide
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 250,
            child: PageView.builder(
              itemBuilder: (context, index) => CarouselSlider(
                items: List.generate(
                  banner.length,
                  (index) => Image.asset(banner[index]),
                ),
                options: CarouselOptions(
                  height: 400,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
          ),
          // trending
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SText(
                  text: 'Trending',
                  font: Font.regular,
                  size: 16,
                ),
                Row(
                  children: [
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 2,
                        activeTrackColor: SColors.primary,
                        thumbColor: Colors.transparent,
                        inactiveTrackColor: const Color(0xFFFFECEC),
                        thumbShape: const RoundSliderThumbShape(
                          enabledThumbRadius: 0.0,
                        ),
                      ),
                      child: Slider(
                        max: 5,
                        value: 1,
                        min: 0,
                        onChanged: (value) {},
                      ),
                    ),
                    const SText(
                      text: '01/5',
                      font: Font.regular,
                      size: 16,
                      color: SColors.primary,
                    ),
                  ],
                ),
              ],
            ),
          ),
          // product grid
          GridView.builder(
            shrinkWrap: true,
            physics: AlwaysScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              mainAxisExtent: 400,
            ),
            itemBuilder: (context, index) => Container(
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
