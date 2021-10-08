import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:token2wallet/app/data/models/transactions_model.dart';
import 'package:token2wallet/app/data/services/home_page_services.dart';
import 'dart:js' as js;

class HomeController extends GetxController {
  List<Result> transList;
  TextEditingController searchAddress = TextEditingController();
  bool isLoading = false;
  bool error = false;
  click() async {
    try {
      isLoading = true;
      update();
      var transactions =
          await HomePageService.fetchTransactions(searchAddress.text);
      if (transactions != null) {
        //transList = transactions;
        final cleanTrans = Set();
        transactions.result
            .retainWhere((x) => cleanTrans.add(x.contractAddress));
        transList = transactions.result;
      } else {
        error = true;
      }
    } finally {
      isLoading = false;
      update();
    }
  }

  addToken(addr, sym, dec, img) async {
    js.context.callMethod("addToken", [addr, sym, dec, img]);
  }
}
