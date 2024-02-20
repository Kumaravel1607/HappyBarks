class CartCountResponse {
  bool? status;
  ResponseData? responseData;
  String? responseMessage;

  CartCountResponse({this.status, this.responseData, this.responseMessage});

  CartCountResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    responseData = json['response_data'] != null
        ? new ResponseData.fromJson(json['response_data'])
        : null;
    responseMessage = json['response_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.responseData != null) {
      data['response_data'] = this.responseData!.toJson();
    }
    data['response_message'] = this.responseMessage;
    return data;
  }
}

class ResponseData {
  int? cartCount;

  ResponseData({this.cartCount});

  ResponseData.fromJson(Map<String, dynamic> json) {
    cartCount = json['cart_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cart_count'] = this.cartCount;
    return data;
  }
}
