import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatelessWidget {
  ImagePickerWidget({
    super.key,
    required this.onSelectedImage,
  });
  final Function(XFile? image) onSelectedImage;
  final ValueNotifier<XFile?> image = ValueNotifier<XFile?>(null);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValueListenableBuilder<XFile?>(
            valueListenable: image,
            builder: (BuildContext context, value, child) {
              if (image.value != null) {
                return SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.file(File(image.value!.path)));
              } else {
                return SizedBox();
              }
            }),
        TextButton(
          onPressed: () async {
            final ImagePicker picker = ImagePicker();
            image.value = await picker.pickImage(
                source: ImageSource.gallery, imageQuality: 50);

            onSelectedImage(image.value);
          },
          child: Row(
            children: [
              CircleAvatar(
                child: Stack(children: [
                  Positioned(child: Image.asset( "assets/images/sign_up_stack.png" )),
                  Center(child: CircleAvatar(backgroundColor: Colors.transparent,child: Icon(Icons.camera_alt_outlined),))
                  
               
                ]),
              ),
              Text(
                "Add a profile picture".tr(),
                style: TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
