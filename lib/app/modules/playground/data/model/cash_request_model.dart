class CashRequestModel {
  int amount;
  String status;
  int id;
  String event;
  CashUserModel provider;
  CashUserModel requester;
  String type;

  CashRequestModel({
    required this.amount,
    required this.event,
    required this.id,
    required this.provider,
    required this.requester,
    required this.status,
    required this.type,
  });

  factory CashRequestModel.fromJson(Map<String, dynamic> json) {
    return CashRequestModel(
      amount: json["amount"],
      event: json["event"],
      id: json["id"],
      provider: CashUserModel.fromJson(json['provider']),
      requester: CashUserModel.fromJson(json['requester']),
      status: json["status"],
      type: json["type"],
    );
  }

  factory CashRequestModel.demo() {
    return CashRequestModel(
      amount: 0,
      event: "some",
      id: 0,
      provider: CashUserModel.empty(),
      requester: CashUserModel.empty(),
      status: "create",
      type: "withdraw",
    );
  }
}

class CashUserModel {
  String name;
  String phone;
  String username;

  CashUserModel({
    required this.name,
    required this.phone,
    required this.username,
  });

  factory CashUserModel.fromJson(Map<String, dynamic> json) {
    return CashUserModel(
      name: json["name"],
      phone: json["phone"],
      username: json["username"],
    );
  }

  factory CashUserModel.empty() {
    return CashUserModel(
      name: "none",
      phone: "none",
      username: "none",
    );
  }
}
