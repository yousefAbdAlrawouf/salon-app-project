import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SelectOneFromOptionsWidget extends StatefulWidget {
  const SelectOneFromOptionsWidget({
    super.key,
    required this.items,
    required this.onOptionSelected,
    required this.name
  });
  final List<String> items;
  final String name;
  final Function(String selectedGender) onOptionSelected;
  @override
  State<SelectOneFromOptionsWidget> createState() =>
      _SelectOneFromOptionsWidgetState();
}

class _SelectOneFromOptionsWidgetState
    extends State<SelectOneFromOptionsWidget> {
  int currentINdex = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.name,style: TextStyle(fontWeight: FontWeight.bold),),
        Row(children: [
          ...List.generate(widget.items.length, (index) {
            return Expanded(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            index == currentINdex ? Colors.red : Colors.white),
                    onPressed: () {
                      //final gender = currentINdex == 0 ? 'female' : 'male';
                     
        
                      setState(() {
                        currentINdex = index;
                      });
                       widget.onOptionSelected(widget.items[currentINdex]);
                    },
                    child: Text(widget.items[index].tr())));
          }),
        ]),
      ],
    );
  }
}
