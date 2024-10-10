import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:web_funnel/core/extensions/theme_extensions.dart';

@RoutePage()
class PhoneSkeletonPage extends StatelessWidget {
  const PhoneSkeletonPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: context.colors.window,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              children: [
                Center(
                  child: Container(
                    height: screenHeight * 0.85,
                    width: screenWidth * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(88),
                      border: Border.all(color: context.colors.phoneBorder, width: 8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 30, 10, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '9:41',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: context.colors.white,
                            ),
                          ),
                          Container(
                            height: 54,
                            width: 181,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              color: context.colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
