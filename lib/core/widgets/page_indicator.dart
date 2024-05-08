import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required PageController pageController,
    required this.cardsNumber,
  }) : _pageController = pageController;

  final PageController _pageController;
  final int cardsNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SmoothPageIndicator(
            axisDirection: Axis.vertical,
            controller: _pageController,
            count: cardsNumber,
            onDotClicked: (index) {
              _pageController.animateToPage(
                index,
                duration: const Duration(
                  milliseconds: 300,
                ),
                curve: Curves.easeIn,
              );
            },
            effect: const ExpandingDotsEffect(
              // dotColor: Colors.transparent,
              paintStyle: PaintingStyle.fill,
              strokeWidth: 1,
              dotHeight: 5,
              dotWidth: 5,
              spacing: 10,
              dotColor: Color(
                0xff182F78,
              ),
              expansionFactor: 9,
              activeDotColor: Color(
                0xff182F78,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
