import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:token2wallet/app/data/models/transactions_model.dart';

class HomePageService {
  String errorString;
  static Future<TransactionsModel> fetchTransactions(String address) async {
    try {
      String url =
          'https://api-kovan.etherscan.io/api?module=account&action=tokentx&address=$address&page=1&offset=100&sort=asc&apikey=XF1FNZIEBUBR28IYHJJWYUQZCMHGSFWIA7';
      var response = await Dio()
          .get(url, options: Options(responseType: ResponseType.json));
      return TransactionsModel.fromJson(response.data);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
