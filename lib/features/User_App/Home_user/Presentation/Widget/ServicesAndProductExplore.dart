
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ServicesAndProductSection extends StatelessWidget {
  const ServicesAndProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Our Services".tr(),
              style:
                  TextStyle(color: Color.fromRGBO(74, 23, 46, 1), fontSize: 24),
            ),
            Spacer(),
            InkWell(
              child: Row(children: [
                Text("See All".tr()),
                Icon(Icons.arrow_right_outlined)
              ]),
            )
          ],
        ),
        const SizedBox(height: 21),
        //Services nails hair ..
        const SizedBox(height: 18),
        Text(
          "Explore Services & Products".tr(),
          style: TextStyle(color: Color.fromRGBO(67, 21, 42, 1), fontSize: 24),
        ),
        const SizedBox(height: 26),
        Row(
          children: [
            Expanded(child: coustomListTile("Services".tr(),Icon(Icons.abc),"300",Icon(Icons.arrow_right_alt))),
            SizedBox(width: 6),
            Expanded(child: coustomListTile("Product".tr(),Icon(Icons.abc),"200",Icon(Icons.arrow_right_alt))),

          ],
        ),
      ],
    );
  }
}

ListTile coustomListTile(String name, Widget image, String count, Widget icon) {
  return ListTile(
    tileColor: Colors.pink,
    leading: image,
    title: Text(name, style: TextStyle(color: Colors.black)),
    subtitle: Text("$count $name"),
    subtitleTextStyle: TextStyle(color: Colors.black),
    trailing: icon,
  );
}
