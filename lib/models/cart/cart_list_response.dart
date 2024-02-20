// class CartListResponse {
//   bool? status;
//   CartListResponseData? responseData;
//   String? responseMessage;

//   CartListResponse({this.status, this.responseData, this.responseMessage});

//   CartListResponse.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     responseData = json['response_data'] != null
//         ? new CartListResponseData.fromJson(json['response_data'])
//         : null;
//     responseMessage = json['response_message'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.responseData != null) {
//       data['response_data'] = this.responseData!.toJson();
//     }
//     data['response_message'] = this.responseMessage;
//     return data;
//   }
// }

// class CartListResponseData {
//   List<CartList>? cartList;
//   List<Variations>? variations;
//   List<Images>? images;

//   CartListResponseData({this.cartList, this.variations, this.images});

//   CartListResponseData.fromJson(Map<String, dynamic> json) {
//     if (json['cart_list'] != null) {
//       cartList = <CartList>[];
//       json['cart_list'].forEach((v) {
//         cartList!.add(new CartList.fromJson(v));
//       });
//     }
//     if (json['variations'] != null) {
//       variations = <Variations>[];
//       json['variations'].forEach((v) {
//         variations!.add(new Variations.fromJson(v));
//       });
//     }
//     if (json['images'] != null) {
//       images = <Images>[];
//       json['images'].forEach((v) {
//         images!.add(new Images.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.cartList != null) {
//       data['cart_list'] = this.cartList!.map((v) => v.toJson()).toList();
//     }
//     if (this.variations != null) {
//       data['variations'] = this.variations!.map((v) => v.toJson()).toList();
//     }
//     if (this.images != null) {
//       data['images'] = this.images!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class CartList {
//   int? productId;
//   int? quantity;
//   int? amount;
//   String? productName;
//   String? brandName;

//   CartList(
//       {this.productId,
//       this.quantity,
//       this.amount,
//       this.productName,
//       this.brandName});

//   CartList.fromJson(Map<String, dynamic> json) {
//     productId = json['product_id'];
//     quantity = json['quantity'];
//     amount = json['amount'];
//     productName = json['product_name'];
//     brandName = json['brand_name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['product_id'] = this.productId;
//     data['quantity'] = this.quantity;
//     data['amount'] = this.amount;
//     data['product_name'] = this.productName;
//     data['brand_name'] = this.brandName;
//     return data;
//   }
// }

// class Variations {
//   int? id;
//   String? productId;
//   String? size;
//   String? price;
//   String? disPrice;
//   String? createdAt;
//   String? updatedAt;

//   Variations(
//       {this.id,
//       this.productId,
//       this.size,
//       this.price,
//       this.disPrice,
//       this.createdAt,
//       this.updatedAt});

//   Variations.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     productId = json['product_id'];
//     size = json['size'];
//     price = json['price'];
//     disPrice = json['dis_price'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['product_id'] = this.productId;
//     data['size'] = this.size;
//     data['price'] = this.price;
//     data['dis_price'] = this.disPrice;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }

// class Images {
//   int? id;
//   int? productId;
//   String? images;
//   String? createdAt;
//   String? updatedAt;

//   Images(
//       {this.id, this.productId, this.images, this.createdAt, this.updatedAt});

//   Images.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     productId = json['product_id'];
//     images = json['images'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['product_id'] = this.productId;
//     data['images'] = this.images;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }

class CartListResponse {
  bool? status;
  CartListResponseData? responseData;
  String? responseMessage;

  CartListResponse({this.status, this.responseData, this.responseMessage});

  CartListResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    responseData = json['response_data'] != null
        ? new CartListResponseData.fromJson(json['response_data'])
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

class CartListResponseData {
  List<CartList>? cartList;
  List<Images>? images;

  CartListResponseData({this.cartList, this.images});

  CartListResponseData.fromJson(Map<String, dynamic> json) {
    if (json['cart_list'] != null) {
      cartList = <CartList>[];
      json['cart_list'].forEach((v) {
        cartList!.add(new CartList.fromJson(v));
      });
    }
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cartList != null) {
      data['cart_list'] = this.cartList!.map((v) => v.toJson()).toList();
    }
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartList {
  int? productId;
  int? quantity;
  int? amount;
  int? varientId;
  String? productName;
  String? brandName;

  CartList(
      {this.productId,
      this.quantity,
      this.amount,
      this.varientId,
      this.productName,
      this.brandName});

  CartList.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    quantity = json['quantity'];
    amount = json['amount'];
    varientId = json['varient_id'];
    productName = json['product_name'];
    brandName = json['brand_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['quantity'] = this.quantity;
    data['amount'] = this.amount;
    data['varient_id'] = this.varientId;
    data['product_name'] = this.productName;
    data['brand_name'] = this.brandName;
    return data;
  }
}

class Images {
  int? id;
  int? productId;
  String? images;
  String? createdAt;
  String? updatedAt;

  Images(
      {this.id, this.productId, this.images, this.createdAt, this.updatedAt});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    images = json['images'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['images'] = this.images;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
