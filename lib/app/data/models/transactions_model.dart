class TransactionsModel {
  TransactionsModel({
    this.status,
    this.message,
    this.result,
  });

  String status;
  String message;
  List<Result> result;

  factory TransactionsModel.fromJson(Map<String, dynamic> json) =>
      TransactionsModel(
        status: json["status"],
        message: json["message"],
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.blockNumber,
    this.timeStamp,
    this.contractAddress,
  });

  String blockNumber;
  String timeStamp;
  String contractAddress;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        blockNumber: json["blockNumber"],
        timeStamp: json["timeStamp"],
        contractAddress: json["contractAddress"],
      );

  Map<String, dynamic> toJson() => {
        "blockNumber": blockNumber,
        "timeStamp": timeStamp,
        "contractAddress": contractAddress,
      };
}
