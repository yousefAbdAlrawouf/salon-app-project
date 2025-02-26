
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:salon_app/features/products_and_services/presentation/manager/Products_And_Services_Cubit.dart';
import 'package:salon_app/features/products_and_services/presentation/manager/Products_And_Services_State.dart';

// ignore: must_be_immutable
class Addproduct extends StatelessWidget {
  Addproduct({super.key});
  TextEditingController proudctName = TextEditingController();
  TextEditingController categoryType = TextEditingController();
  TextEditingController branches = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController description = TextEditingController();
  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Product".tr())),
      body: Form(
          child: Padding(
        padding: const EdgeInsets.only(right: 20.0, left: 20),
        child: Column(
          children: [
            SizedBox(height: 25),
            TextField(
              controller: proudctName,
              decoration:
                  InputDecoration(hintText: "Product Name", filled: true),
            ),
            SizedBox(height: 25),
            TextField(
              controller: categoryType,
              decoration: InputDecoration(
                  hintText: "select Category Type", filled: true),
            ),
            SizedBox(height: 25),
            TextField(
              controller: branches,
              decoration:
                  InputDecoration(hintText: "select branch Type", filled: true),
            ),
            SizedBox(height: 25),
            TextField(
              controller: price,
              decoration: InputDecoration(hintText: "price", filled: true),
            ),
            SizedBox(height: 25),
            TextField(
              controller: description,
              decoration:
                  InputDecoration(hintText: "description", filled: true),
            ),
            TextButton(
              onPressed: () async {
                final ImagePicker picker = ImagePicker();

                image = await picker.pickImage(source: ImageSource.gallery);
              },
              child: Text("Add New Photo"),
            ),
            BlocBuilder<ProductsAndServicesCubit, ProductsAndServicesState>(
                builder: (context, state) {
              return TextButton(
                  onPressed: () {
                   // context.read<ProductsAndServicesCubit>().Addproduct();
                  },
                  child: Text("Add New Product"));
            })
          ],
        ),
      )),
    );
  }
}
