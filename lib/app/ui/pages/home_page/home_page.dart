import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:token2wallet/app/data/models/transactions_model.dart';
import '../../../controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  final HomeController c = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GetBuilder<HomeController>(builder: (_) {
                if (c.isLoading == true) {
                  return Center(
                      child: Container(
                          padding: EdgeInsets.all(300),
                          child: CircularProgressIndicator()));
                } else if (c.error == true) {
                  return Center(
                      child: Container(
                          padding: EdgeInsets.all(300),
                          child:
                              Text("Connections issue to Ethereum Network")));
                } else if (c.transList == null) {
                  return Center(
                      child: Container(
                          padding: EdgeInsets.all(300),
                          child: Column(
                            children: [
                              Text("Paste Your Wallet Address"),
                              TextField(
                                controller: c.searchAddress,
                              ),
                            ],
                          )));
                } else if (c.transList.length == 0) {
                  return Center(
                      child: Container(
                          padding: EdgeInsets.all(300),
                          child: Text("Connections issue to Etherscan Data")));
                } else {
                  return Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: DataTable2(
                            columnSpacing: 5,
                            minWidth: 600,
                            columns: [
                              DataColumn(
                                label: Text("BlockNumber"),
                              ),
                              DataColumn(
                                label: Text("Token Contract Address"),
                              ),
                              DataColumn(
                                label: Text("Add Token"),
                              ),
                            ],
                            rows: List.generate(
                              c.transList.length,
                              (index) => recentFileDataRow(
                                  c.transList[index], context, c),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              }),
              FloatingActionButton(
                child: Icon(Icons.send),
                onPressed: () {
                  c.click();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

DataRow recentFileDataRow(Result Results, context, HomeController c) {
  return DataRow(
    cells: [
      DataCell(Text(Results.blockNumber)),
      DataCell(SelectableText(Results.contractAddress)),
      DataCell(Row(
        children: [
          IconButton(
              onPressed: () {
                c.addToken(
                    '0xb453f1f2ee776daf2586501361c457db70e1ca0f',
                    'AGAr',
                    8,
                    'https://dev.w3.org/SVG/tools/svgweb/samples/svg-files/410.svg');
              },
              icon: Icon(Icons.add)),
        ],
      )),
    ],
  );
}
