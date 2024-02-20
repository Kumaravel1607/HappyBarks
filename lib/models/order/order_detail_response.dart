// class OrderDetailResponse {
//   bool? status;
//   OrderDetailResponseData? responseData;
//   String? responseMessage;

//   OrderDetailResponse({this.status, this.responseData, this.responseMessage});

//   OrderDetailResponse.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     responseData = json['response_data'] != null
//         ? new OrderDetailResponseData.fromJson(json['response_data'])
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

// class OrderDetailResponseData {
//   int? id;
//   String? transactionId;
//   String? orderId;
//   String? userId;
//   String? productId;
//   String? paymentType;
//   String? totalAmount;
//   int? qty;
//   String? status;
//   String? createdAt;
//   String? updatedAt;

//   OrderDetailResponseData(
//       {this.id,
//       this.transactionId,
//       this.orderId,
//       this.userId,
//       this.productId,
//       this.paymentType,
//       this.totalAmount,
//       this.qty,
//       this.status,
//       this.createdAt,
//       this.updatedAt});

//   OrderDetailResponseData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     transactionId = json['transaction_id'];
//     orderId = json['order_id'];
//     userId = json['user_id'];
//     productId = json['product_id'];
//     paymentType = json['payment_type'];
//     totalAmount = json['total_amount'];
//     qty = json['qty'];
//     status = json['status'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['transaction_id'] = this.transactionId;
//     data['order_id'] = this.orderId;
//     data['user_id'] = this.userId;
//     data['product_id'] = this.productId;
//     data['payment_type'] = this.paymentType;
//     data['total_amount'] = this.totalAmount;
//     data['qty'] = this.qty;
//     data['status'] = this.status;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }

class OrderDetailResponse {
  bool? status;
  ResponseData? responseData;
  String? responseMessage;

  OrderDetailResponse({this.status, this.responseData, this.responseMessage});

  OrderDetailResponse.fromJson(Map<String, dynamic> json) {
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
  OrderList? orderList;
  Address? address;
  List<OrderItems>? orderItems;

  ResponseData({this.orderList, this.address, this.orderItems});

  ResponseData.fromJson(Map<String, dynamic> json) {
    orderList = json['order_list'] != null
        ? new OrderList.fromJson(json['order_list'])
        : null;
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    if (json['order_items'] != null) {
      orderItems = <OrderItems>[];
      json['order_items'].forEach((v) {
        orderItems!.add(new OrderItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orderList != null) {
      data['order_list'] = this.orderList!.toJson();
    }
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    if (this.orderItems != null) {
      data['order_items'] = this.orderItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderList {
  int? id;
  String? transactionId;
  String? orderId;
  String? userId;
  String? paymentType;
  String? totalAmount;
  String? status;
  String? addressId;
  Null? orderDate;
  Null? deliveryDate;
  String? createdAt;
  String? updatedAt;

  OrderList(
      {this.id,
      this.transactionId,
      this.orderId,
      this.userId,
      this.paymentType,
      this.totalAmount,
      this.status,
      this.addressId,
      this.orderDate,
      this.deliveryDate,
      this.createdAt,
      this.updatedAt});

  OrderList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transactionId = json['transaction_id'];
    orderId = json['order_id'];
    userId = json['user_id'];
    paymentType = json['payment_type'];
    totalAmount = json['total_amount'];
    status = json['status'];
    addressId = json['address_id'];
    orderDate = json['order_date'];
    deliveryDate = json['delivery_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['transaction_id'] = this.transactionId;
    data['order_id'] = this.orderId;
    data['user_id'] = this.userId;
    data['payment_type'] = this.paymentType;
    data['total_amount'] = this.totalAmount;
    data['status'] = this.status;
    data['address_id'] = this.addressId;
    data['order_date'] = this.orderDate;
    data['delivery_date'] = this.deliveryDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Address {
  int? id;
  String? userId;
  String? fullName;
  String? country;
  String? address1;
  String? address2;
  String? city;
  String? state;
  String? phone;
  String? email;
  String? pincode;
  String? setPrimary;
  String? createdAt;
  String? updatedAt;

  Address(
      {this.id,
      this.userId,
      this.fullName,
      this.country,
      this.address1,
      this.address2,
      this.city,
      this.state,
      this.phone,
      this.email,
      this.pincode,
      this.setPrimary,
      this.createdAt,
      this.updatedAt});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    fullName = json['full_name'];
    country = json['country'];
    address1 = json['address1'];
    address2 = json['address2'];
    city = json['city'];
    state = json['state'];
    phone = json['phone'];
    email = json['email'];
    pincode = json['pincode'];
    setPrimary = json['set_primary'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['full_name'] = this.fullName;
    data['country'] = this.country;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['city'] = this.city;
    data['state'] = this.state;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['pincode'] = this.pincode;
    data['set_primary'] = this.setPrimary;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class OrderItems {
  int? id;
  int? productId;
  String? size;
  String? price;
  String? disPrice;
  String? createdAt;
  String? updatedAt;
  int? orderId;
  int? userId;
  int? varientId;
  int? quantity;
  int? amount;
  int? categoryId;
  int? subcategoryId;
  int? brandId;
  String? name;
  Null? petBread;
  Null? breadType;
  String? type;
  String? sku;
  String? productType;
  String? lifeStage;
  String? breedSize;
  String? eatType;
  String? shopBy;
  String? manufactureProduct;
  String? returnPolicy;
  String? description;
  String? image;
  Null? age;
  Null? gender;
  Null? vetConsultation;
  Null? breedTitle;
  Null? breedDescription;
  Null? breedFacts;
  Null? breedFactsDescription;
  Null? familyLife;
  Null? physical;
  Null? social;
  Null? personality;
  Null? allTraits;
  Null? identifyingRightBreedTitle;
  Null? identifyingRightBreedDesc;
  Null? aboutPuppy;
  Null? vaccinationPuppy;
  Null? covered;
  Null? mealTitle;
  Null? mealDesc;
  Null? buyingProcess;
  Null? images;
  Null? discount;
  Null? isFeatured;
  int? status;

  OrderItems(
      {this.id,
      this.productId,
      this.size,
      this.price,
      this.disPrice,
      this.createdAt,
      this.updatedAt,
      this.orderId,
      this.userId,
      this.varientId,
      this.quantity,
      this.amount,
      this.categoryId,
      this.subcategoryId,
      this.brandId,
      this.name,
      this.petBread,
      this.breadType,
      this.type,
      this.sku,
      this.productType,
      this.lifeStage,
      this.breedSize,
      this.eatType,
      this.shopBy,
      this.manufactureProduct,
      this.returnPolicy,
      this.description,
      this.image,
      this.age,
      this.gender,
      this.vetConsultation,
      this.breedTitle,
      this.breedDescription,
      this.breedFacts,
      this.breedFactsDescription,
      this.familyLife,
      this.physical,
      this.social,
      this.personality,
      this.allTraits,
      this.identifyingRightBreedTitle,
      this.identifyingRightBreedDesc,
      this.aboutPuppy,
      this.vaccinationPuppy,
      this.covered,
      this.mealTitle,
      this.mealDesc,
      this.buyingProcess,
      this.images,
      this.discount,
      this.isFeatured,
      this.status});

  OrderItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    size = json['size'];
    price = json['price'];
    disPrice = json['dis_price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    orderId = json['order_id'];
    userId = json['user_id'];
    varientId = json['varient_id'];
    quantity = json['quantity'];
    amount = json['amount'];
    categoryId = json['category_id'];
    subcategoryId = json['subcategory_id'];
    brandId = json['brand_id'];
    name = json['name'];
    petBread = json['pet_bread'];
    breadType = json['bread_type'];
    type = json['type'];
    sku = json['sku'];
    productType = json['product_type'];
    lifeStage = json['life_stage'];
    breedSize = json['breed_size'];
    eatType = json['eat_type'];
    shopBy = json['shop_by'];
    manufactureProduct = json['manufacture_product'];
    returnPolicy = json['return_policy'];
    description = json['description'];
    image = json['image'];
    age = json['age'];
    gender = json['gender'];
    vetConsultation = json['vet_consultation'];
    breedTitle = json['breed_title'];
    breedDescription = json['breed_description'];
    breedFacts = json['breed_facts'];
    breedFactsDescription = json['breed_facts_description'];
    familyLife = json['family_life'];
    physical = json['physical'];
    social = json['social'];
    personality = json['personality'];
    allTraits = json['all_traits'];
    identifyingRightBreedTitle = json['identifying_right_breed_title'];
    identifyingRightBreedDesc = json['identifying_right_breed_desc'];
    aboutPuppy = json['about_puppy'];
    vaccinationPuppy = json['vaccination_puppy'];
    covered = json['covered'];
    mealTitle = json['meal_title'];
    mealDesc = json['meal_desc'];
    buyingProcess = json['buying_process'];
    images = json['images'];
    discount = json['discount'];
    isFeatured = json['is_featured'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['size'] = this.size;
    data['price'] = this.price;
    data['dis_price'] = this.disPrice;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['order_id'] = this.orderId;
    data['user_id'] = this.userId;
    data['varient_id'] = this.varientId;
    data['quantity'] = this.quantity;
    data['amount'] = this.amount;
    data['category_id'] = this.categoryId;
    data['subcategory_id'] = this.subcategoryId;
    data['brand_id'] = this.brandId;
    data['name'] = this.name;
    data['pet_bread'] = this.petBread;
    data['bread_type'] = this.breadType;
    data['type'] = this.type;
    data['sku'] = this.sku;
    data['product_type'] = this.productType;
    data['life_stage'] = this.lifeStage;
    data['breed_size'] = this.breedSize;
    data['eat_type'] = this.eatType;
    data['shop_by'] = this.shopBy;
    data['manufacture_product'] = this.manufactureProduct;
    data['return_policy'] = this.returnPolicy;
    data['description'] = this.description;
    data['image'] = this.image;
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['vet_consultation'] = this.vetConsultation;
    data['breed_title'] = this.breedTitle;
    data['breed_description'] = this.breedDescription;
    data['breed_facts'] = this.breedFacts;
    data['breed_facts_description'] = this.breedFactsDescription;
    data['family_life'] = this.familyLife;
    data['physical'] = this.physical;
    data['social'] = this.social;
    data['personality'] = this.personality;
    data['all_traits'] = this.allTraits;
    data['identifying_right_breed_title'] = this.identifyingRightBreedTitle;
    data['identifying_right_breed_desc'] = this.identifyingRightBreedDesc;
    data['about_puppy'] = this.aboutPuppy;
    data['vaccination_puppy'] = this.vaccinationPuppy;
    data['covered'] = this.covered;
    data['meal_title'] = this.mealTitle;
    data['meal_desc'] = this.mealDesc;
    data['buying_process'] = this.buyingProcess;
    data['images'] = this.images;
    data['discount'] = this.discount;
    data['is_featured'] = this.isFeatured;
    data['status'] = this.status;
    return data;
  }
}
