import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OrderLocationSection extends StatelessWidget {
  const OrderLocationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              "assets/icons/location.svg",
              colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
              width: 20,
              height: 20,
            ),
            SizedBox(width: 8),
            Text(
              "Home",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
        SizedBox(height: 6),
        RichText(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
            children: [
              TextSpan(
                text: "Country Name",
                style: TextStyle(
                    color: Color.fromRGBO(81, 81, 81, 1), fontSize: 16),
              ),
              TextSpan(
                text: " • ",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              TextSpan(
                text: "City Name",
                style: TextStyle(
                    color: Color.fromRGBO(81, 81, 81, 1), fontSize: 16),
              ),
              TextSpan(
                text: " • ",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              TextSpan(
                text: "Street 13 ...",
                style: TextStyle(
                    color: Color.fromRGBO(81, 81, 81, 1), fontSize: 16),
              ),
            ],
          ),
        )
      ],
    );
  }
}
