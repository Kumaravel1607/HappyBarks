class OtpVerifyResponse {
  bool? status;
  OtpVerifyResponseData? responseData;
  String? responseMessage;

  OtpVerifyResponse({this.status, this.responseData, this.responseMessage});

  OtpVerifyResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    responseData = json['response_data'] != null
        ? new OtpVerifyResponseData.fromJson(json['response_data'])
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

class OtpVerifyResponseData {
  String? token;
  String? msg;
  String? name;

  OtpVerifyResponseData({this.token, this.msg, this.name});

  OtpVerifyResponseData.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    msg = json['msg'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['msg'] = this.msg;
    data['name'] = this.name;
    return data;
  }
}
