// class ProductDetailResponse {
//   bool? status;
//   List<ProductDetailResponseData>? responseData;
//   String? responseMessage;

//   ProductDetailResponse({this.status, this.responseData, this.responseMessage});

//   ProductDetailResponse.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     if (json['response_data'] != null) {
//       responseData = <ProductDetailResponseData>[];
//       json['response_data'].forEach((v) {
//         responseData!.add(new ProductDetailResponseData.fromJson(v));
//       });
//     }
//     responseMessage = json['response_message'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.responseData != null) {
//       data['response_data'] =
//           this.responseData!.map((v) => v.toJson()).toList();
//     }
//     data['response_message'] = this.responseMessage;
//     return data;
//   }
// }

// class ProductDetailResponseData {
//   int? id;
//   int? categoryId;
//   int? subcategoryId;
//   int? brandId;
//   String? name;
//   dynamic petBread;
//   dynamic breadType;
//   String? type;
//   dynamic sku;
//   String? productType;
//   String? lifeStage;
//   String? breedSize;
//   String? eatType;
//   String? shopBy;
//   String? manufactureProduct;
//   String? returnPolicy;
//   String? description;
//   String? image;
//   dynamic age;
//   dynamic gender;
//   dynamic vetConsultation;
//   dynamic breedTitle;
//   dynamic breedDescription;
//   dynamic breedFacts;
//   dynamic breedFactsDescription;
//   dynamic familyLife;
//   dynamic physical;
//   dynamic social;
//   dynamic personality;
//   dynamic allTraits;
//   dynamic identifyingRightBreedTitle;
//   dynamic identifyingRightBreedDesc;
//   dynamic aboutPuppy;
//   dynamic vaccinationPuppy;
//   dynamic covered;
//   dynamic mealTitle;
//   dynamic mealDesc;
//   dynamic buyingProcess;
//   dynamic images;
//   dynamic discount;
//   dynamic isFeatured;
//   int? status;
//   String? createdAt;
//   String? updatedAt;
//   String? productId;
//   String? size;
//   String? price;
//   String? disPrice;

//   ProductDetailResponseData(
//       {this.id,
//       this.categoryId,
//       this.subcategoryId,
//       this.brandId,
//       this.name,
//       this.petBread,
//       this.breadType,
//       this.type,
//       this.sku,
//       this.productType,
//       this.lifeStage,
//       this.breedSize,
//       this.eatType,
//       this.shopBy,
//       this.manufactureProduct,
//       this.returnPolicy,
//       this.description,
//       this.image,
//       this.age,
//       this.gender,
//       this.vetConsultation,
//       this.breedTitle,
//       this.breedDescription,
//       this.breedFacts,
//       this.breedFactsDescription,
//       this.familyLife,
//       this.physical,
//       this.social,
//       this.personality,
//       this.allTraits,
//       this.identifyingRightBreedTitle,
//       this.identifyingRightBreedDesc,
//       this.aboutPuppy,
//       this.vaccinationPuppy,
//       this.covered,
//       this.mealTitle,
//       this.mealDesc,
//       this.buyingProcess,
//       this.images,
//       this.discount,
//       this.isFeatured,
//       this.status,
//       this.createdAt,
//       this.updatedAt,
//       this.productId,
//       this.size,
//       this.price,
//       this.disPrice});

//   ProductDetailResponseData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     categoryId = json['category_id'];
//     subcategoryId = json['subcategory_id'];
//     brandId = json['brand_id'];
//     name = json['name'];
//     petBread = json['pet_bread'];
//     breadType = json['bread_type'];
//     type = json['type'];
//     sku = json['sku'];
//     productType = json['product_type'];
//     lifeStage = json['life_stage'];
//     breedSize = json['breed_size'];
//     eatType = json['eat_type'];
//     shopBy = json['shop_by'];
//     manufactureProduct = json['manufacture_product'];
//     returnPolicy = json['return_policy'];
//     description = json['description'];
//     image = json['image'];
//     age = json['age'];
//     gender = json['gender'];
//     vetConsultation = json['vet_consultation'];
//     breedTitle = json['breed_title'];
//     breedDescription = json['breed_description'];
//     breedFacts = json['breed_facts'];
//     breedFactsDescription = json['breed_facts_description'];
//     familyLife = json['family_life'];
//     physical = json['physical'];
//     social = json['social'];
//     personality = json['personality'];
//     allTraits = json['all_traits'];
//     identifyingRightBreedTitle = json['identifying_right_breed_title'];
//     identifyingRightBreedDesc = json['identifying_right_breed_desc'];
//     aboutPuppy = json['about_puppy'];
//     vaccinationPuppy = json['vaccination_puppy'];
//     covered = json['covered'];
//     mealTitle = json['meal_title'];
//     mealDesc = json['meal_desc'];
//     buyingProcess = json['buying_process'];
//     images = json['images'];
//     discount = json['discount'];
//     isFeatured = json['is_featured'];
//     status = json['status'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     productId = json['product_id'];
//     size = json['size'];
//     price = json['price'];
//     disPrice = json['dis_price'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['category_id'] = this.categoryId;
//     data['subcategory_id'] = this.subcategoryId;
//     data['brand_id'] = this.brandId;
//     data['name'] = this.name;
//     data['pet_bread'] = this.petBread;
//     data['bread_type'] = this.breadType;
//     data['type'] = this.type;
//     data['sku'] = this.sku;
//     data['product_type'] = this.productType;
//     data['life_stage'] = this.lifeStage;
//     data['breed_size'] = this.breedSize;
//     data['eat_type'] = this.eatType;
//     data['shop_by'] = this.shopBy;
//     data['manufacture_product'] = this.manufactureProduct;
//     data['return_policy'] = this.returnPolicy;
//     data['description'] = this.description;
//     data['image'] = this.image;
//     data['age'] = this.age;
//     data['gender'] = this.gender;
//     data['vet_consultation'] = this.vetConsultation;
//     data['breed_title'] = this.breedTitle;
//     data['breed_description'] = this.breedDescription;
//     data['breed_facts'] = this.breedFacts;
//     data['breed_facts_description'] = this.breedFactsDescription;
//     data['family_life'] = this.familyLife;
//     data['physical'] = this.physical;
//     data['social'] = this.social;
//     data['personality'] = this.personality;
//     data['all_traits'] = this.allTraits;
//     data['identifying_right_breed_title'] = this.identifyingRightBreedTitle;
//     data['identifying_right_breed_desc'] = this.identifyingRightBreedDesc;
//     data['about_puppy'] = this.aboutPuppy;
//     data['vaccination_puppy'] = this.vaccinationPuppy;
//     data['covered'] = this.covered;
//     data['meal_title'] = this.mealTitle;
//     data['meal_desc'] = this.mealDesc;
//     data['buying_process'] = this.buyingProcess;
//     data['images'] = this.images;
//     data['discount'] = this.discount;
//     data['is_featured'] = this.isFeatured;
//     data['status'] = this.status;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['product_id'] = this.productId;
//     data['size'] = this.size;
//     data['price'] = this.price;
//     data['dis_price'] = this.disPrice;
//     return data;
//   }
// }

class ProductDetailResponse {
  bool? status;
  ProductDetailResponseData? responseData;
  String? responseMessage;

  ProductDetailResponse({this.status, this.responseData, this.responseMessage});

  ProductDetailResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    responseData = json['response_data'] != null
        ? new ProductDetailResponseData.fromJson(json['response_data'])
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

class ProductDetailResponseData {
  Products? products;
  List<Variations>? variations;
  List<Images>? images;

  ProductDetailResponseData({this.products, this.variations, this.images});

  ProductDetailResponseData.fromJson(Map<String, dynamic> json) {
    products = json['products'] != null
        ? new Products.fromJson(json['products'])
        : null;
    if (json['variations'] != null) {
      variations = <Variations>[];
      json['variations'].forEach((v) {
        variations!.add(new Variations.fromJson(v));
      });
    }
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.toJson();
    }
    if (this.variations != null) {
      data['variations'] = this.variations!.map((v) => v.toJson()).toList();
    }
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  int? categoryId;
  int? subcategoryId;
  int? brandId;
  String? name;
  String? productName;
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
  String? createdAt;
  String? updatedAt;
  String? slug;
  String? logo;
  String? brandName;

  Products(
      {this.id,
      this.categoryId,
      this.subcategoryId,
      this.brandId,
      this.name,
      this.productName,
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
      this.status,
      this.createdAt,
      this.updatedAt,
      this.slug,
      this.logo,
      this.brandName});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    subcategoryId = json['subcategory_id'];
    brandId = json['brand_id'];
    name = json['name'];
    if (json['product_name'] != null) productName = json['product_name'];
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
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    slug = json['slug'];
    logo = json['logo'];
    brandName = json['brand_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['subcategory_id'] = this.subcategoryId;
    data['brand_id'] = this.brandId;
    data['name'] = this.name;
    data['product_name'] = this.productName;
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
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['slug'] = this.slug;
    data['logo'] = this.logo;
    data['brand_name'] = this.brandName;
    return data;
  }
}

class Variations {
  int? id;
  String? productId;
  String? size;
  String? price;
  String? disPrice;
  String? createdAt;
  String? updatedAt;

  Variations(
      {this.id,
      this.productId,
      this.size,
      this.price,
      this.disPrice,
      this.createdAt,
      this.updatedAt});

  Variations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['product_id'] != null) {
      productId = json['product_id'];
    } else {
      productId = '';
    }
    if (json['size'] != null) {
      size = json['size'];
    } else {
      size = '';
    }
    if (json['price'] != null) {
      price = json['price'];
    } else {
      price = '';
    }
    if (json['dis_price'] != null) {
      disPrice = json['dis_price'];
    } else {
      disPrice = '';
    }
    if (json['created_at'] != null) {
      createdAt = json['created_at'];
    } else {
      createdAt = '';
    }

    if (json['updated_at'] != null) {
      updatedAt = json['updated_at'];
    } else {
      updatedAt = '';
    }
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

    if (json['product_id'] != null) {
      productId = json['product_id'];
    }

    if (json['images'] != null) {
      images = json['images'];
    } else {
      images = '';
    }

    if (json['created_at'] != null) {
      createdAt = json['created_at'];
    } else {
      createdAt = '';
    }
    updatedAt = json['updated_at'];
    if (json['updated_at'] != null) {
      updatedAt = json['updated_at'];
    } else {
      updatedAt = '';
    }
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
