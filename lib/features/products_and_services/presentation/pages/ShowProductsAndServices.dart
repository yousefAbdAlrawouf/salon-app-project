import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:salon_app/core/routes/routes_path.dart';
import 'package:salon_app/features/products_and_services/presentation/manager/Products_And_Services_Cubit.dart';
import 'package:salon_app/features/products_and_services/presentation/manager/Products_And_Services_State.dart';
import 'package:salon_app/features/products_and_services/presentation/widgets/products_List.dart';
import 'package:salon_app/features/products_and_services/presentation/widgets/services_List.dart';

class Showproductsandservices extends StatefulWidget {
  const Showproductsandservices({super.key});

  @override
  State<Showproductsandservices> createState() =>
      _ShowproductsandservicesState();
}

int index = 0;

class _ShowproductsandservicesState extends State<Showproductsandservices> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsAndServicesCubit()..initState(),
      child: Builder(builder: (ctx) {
        return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                context.go(RoutesPath.addNewProduct,
                    extra: BlocProvider.of<ProductsAndServicesCubit>(ctx));
              },
              child: Icon(Icons.add_circle_outline_rounded,size: 30,),
            ),
            appBar: AppBar(
              title: Text("Add Products & Services".tr(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28,fontFamily: "Meditative"),),
            ),
            body: Column(
              children: [
                Divider(),
                BlocBuilder<ProductsAndServicesCubit, ProductsAndServicesState>(
                    builder: (context, state) {
                  return Row(
                    children: [
                      Expanded(
                          child: TextButton(
                              onPressed: () {
                                setState(() {
                                  index = 0;
                                });
                              },
                              child: Center(child: Text("Products".tr(),style: TextStyle(fontFamily: "Meditative",fontSize: 24,color: Colors.black),)))),
                      Expanded(
                          child: TextButton(
                              onPressed: () {
                                setState(() {
                                  index = 1;
                                });
                              },
                              child: Center(
                                child: Text("Services".tr(),style: TextStyle(fontFamily: "Meditative",fontSize: 24,color: Colors.black),),
                              ))),
                    ],
                  );
                }),
                Divider(),
                BlocBuilder<ProductsAndServicesCubit, ProductsAndServicesState>(
                    builder: (context, state) {
                  if (index == 0) {
                    return proudctsList(state);
                  } else if (index == 1) {
                    return servicesList(state);
                  } else {
                    return SizedBox();
                  }
                }),
              ],
            ));
      }),
    );
  }
}
