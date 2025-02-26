
import 'package:flutter/material.dart';

class OrderProfileDetails extends StatelessWidget {
  const OrderProfileDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Image.asset("assets/images/profilePic.png"),
        ),
        SizedBox(width: 12),
        Column(
          children: [
            Text("User Name",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700)),
            Text(
              "1 hr 30 mins",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: Color.fromRGBO(129, 129, 129, 1)),
            )
          ],
        )
      ],
    );
  }
}
