import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:frontend_customers/models/customer.dart';
import 'package:frontend_customers/shared/network/end_points.dart';
import 'package:frontend_customers/shared/network/remote/dio_helper.dart';

part 'state.dart';

class AppHandler extends Cubit<AppState> {
  AppHandler() : super(AppStateInitial()) {
    getCustomers();
  }
  List<Customer> customerList = [];
  void getCustomers() {
    customerList = [];
    DioHelper.getData(url: mainUrl).then((value) {
      value.data.forEach((element) {
        customerList.add(Customer.fromJson(element));
      });
      emit(AppStateDataFetched());
    });
  }

  void deleteCustomer(String id) {
    DioHelper.deleteData(url: mainUrl, id: id).then((value) {
      emit(AppStateCustomerDeleted());
      getCustomers();
    });
  }
  void addCustomer(String name, String email, int age){
    DioHelper.postData(url: mainUrl, data:
      {
        "name": "${name}",
        "email":"${email}",
        "age": age,
      },).then((value) {
        print("value from post ${value.data}");
        emit(AppStateCustomerAdded());
        getCustomers();
    });
  }
}
