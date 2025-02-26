import 'package:flutter/material.dart';
import 'package:salon_app/core/constants/app_colors.dart';

class RatingSection extends StatelessWidget {
  const RatingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<int> ratingCounts = [1343, 324, 122, 90, 33];
    final int maxValue = 1500;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Your Rating In The Application",
          style: TextStyle(
            color: AppColors.primarycolor,
            fontFamily: "Meditative",
            fontSize: 24,
          ),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height / 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width / 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Rating Overview",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height / 40),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "4.8",
                          style: TextStyle(
                            fontSize: 39,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                            fontStyle: FontStyle.italic
                          ),
                        ),
                        TextSpan(
                          text: " /5",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height / 50),
                  Text(
                    "2,343 RATINGS",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(112, 112, 112, 1),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: MediaQuery.sizeOf(context).width / 28),
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  ratingCounts.length,
                  (index) => Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width / 3,
                        child: Stack(
                          children: [
                            Container(
                              height: MediaQuery.sizeOf(context).height / 85,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(235, 235, 235, 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            FractionallySizedBox(
                              alignment: Alignment.centerLeft,
                              widthFactor: ratingCounts[index] / maxValue,
                              child: Container(
                                height: MediaQuery.sizeOf(context).height / 85,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 166, 77, 121),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: MediaQuery.sizeOf(context).width / 28),
                      Text(
                        '${ratingCounts[index]}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          color: Color.fromARGB(136, 136, 136, 136),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
