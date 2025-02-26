import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon_app/features/products_and_services/data/Proudcts_Services_Data_source.dart';
import 'package:salon_app/features/products_and_services/models/createNewProductParams.dart';
import 'package:salon_app/features/products_and_services/presentation/manager/Products_And_Services_State.dart';

class ProductsAndServicesCubit extends Cubit<ProductsAndServicesState> {
  ProductsAndServicesCubit() : super(ProductsAndServicesState(products: [],services: []));

  ProudctsServicesDataSource remote = ProudctsServicesDataSource();


  initState() async {
    log("Hello im here");
    getProducts();
    getServices();
    //Addproduct();

  }

  getProducts() async {
    emit(state.copyWith(isLoading: true));
    final result = await remote.getProducts();
    result.fold((failure) {
      log(failure);
      emit(state.copyWith(error: failure));
    }, (data) {
      log("Data Have Arriven Successfully");
      emit(state.copyWith(products: data));
    });
  }


    getServices() async {
    emit(state.copyWith(isLoading: true));
    final result = await remote.getServices();
    result.fold((failure) {
      log(failure);
      emit(state.copyWith(error: failure));
    }, (data) {
      log("Data Have Arriven Successfully");
      emit(state.copyWith(services: data));
    });
  }

  Addproduct(AddNewProductparams params) async{
    final result = await remote.Addproduct(params);
    result.fold((Failure){
      log(Failure);
    }, (data){
      log("ksdajf ");
    });
  }
}
