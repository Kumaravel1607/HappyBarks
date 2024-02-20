class LoginResponse {
  bool? status;
  LoginResponseData? responseData;
  String? responseMessage;

  LoginResponse({this.status, this.responseData, this.responseMessage});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    responseData = json['response_data'] != null
        ? new LoginResponseData.fromJson(json['response_data'])
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

class LoginResponseData {
  int? otp;

  LoginResponseData({this.otp});

  LoginResponseData.fromJson(Map<String, dynamic> json) {
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['otp'] = this.otp;
    return data;
  }
}
