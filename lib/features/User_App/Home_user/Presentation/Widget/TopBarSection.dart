import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';


class TopBarSection extends StatelessWidget {
  const TopBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(child: SearchBar(leading: Icon(Icons.search,),hintText: "Search".tr())),
        Icon(Icons.filter_list_rounded,color: Color.fromRGBO(166, 77, 121, 1),),
        Text("Filtter".tr(), style: TextStyle(color: Color.fromRGBO(166, 77, 121, 1)),)
      ],
    );
  }
}