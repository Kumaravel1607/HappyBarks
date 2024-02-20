class PincodeCheckResponse {
  bool? status;
  String? responseMessage;

  PincodeCheckResponse({this.status, this.responseMessage});

  PincodeCheckResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    responseMessage = json['response_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['response_message'] = this.responseMessage;
    return data;
  }
}
