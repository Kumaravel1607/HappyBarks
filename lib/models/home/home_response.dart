class HomeResponse {
  bool? status;
  HaomeResponseData? responseData;
  String? responseMessage;

  HomeResponse({this.status, this.responseData, this.responseMessage});

  HomeResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    responseData = json['response_data'] != null
        ? new HaomeResponseData.fromJson(json['response_data'])
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

class HaomeResponseData {
  List<TopBanners>? topBanners;
  List<Categories>? categories;
  List<Brands>? brands;
  List<Products>? products;
  List<TopBanners>? bottomBanner;

  HaomeResponseData(
      {this.topBanners,
      this.categories,
      this.brands,
      this.products,
      this.bottomBanner});

  HaomeResponseData.fromJson(Map<String, dynamic> json) {
    if (json['top_banners'] != null) {
      topBanners = <TopBanners>[];
      json['top_banners'].forEach((v) {
        topBanners!.add(new TopBanners.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    if (json['brands'] != null) {
      brands = <Brands>[];
      json['brands'].forEach((v) {
        brands!.add(new Brands.fromJson(v));
      });
    }
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    if (json['bottom_banner'] != null) {
      bottomBanner = <TopBanners>[];
      json['bottom_banner'].forEach((v) {
        bottomBanner!.add(new TopBanners.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.topBanners != null) {
      data['top_banners'] = this.topBanners!.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.brands != null) {
      data['brands'] = this.brands!.map((v) => v.toJson()).toList();
    }
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    if (this.bottomBanner != null) {
      data['bottom_banner'] =
          this.bottomBanner!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TopBanners {
  int? id;
  String? type;
  String? title;
  String? subTitle;
  String? image;
  String? createdAt;
  String? updatedAt;

  TopBanners(
      {this.id,
      this.type,
      this.title,
      this.subTitle,
      this.image,
      this.createdAt,
      this.updatedAt});

  TopBanners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    title = json['title'];
    subTitle = json['sub_title'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['title'] = this.title;
    data['sub_title'] = this.subTitle;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Categories {
  int? id;
  Null? createdBy;
  String? name;
  Null? amount;
  Null? slug;
  String? status;
  Null? description;
  String? image;
  Null? icon;
  String? createdAt;
  String? updatedAt;

  Categories(
      {this.id,
      this.createdBy,
      this.name,
      this.amount,
      this.slug,
      this.status,
      this.description,
      this.image,
      this.icon,
      this.createdAt,
      this.updatedAt});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdBy = json['created_by'];
    name = json['name'];
    amount = json['amount'];
    slug = json['slug'];
    status = json['status'];
    description = json['description'];
    image = json['image'];
    icon = json['icon'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_by'] = this.createdBy;
    data['name'] = this.name;
    data['amount'] = this.amount;
    data['slug'] = this.slug;
    data['status'] = this.status;
    data['description'] = this.description;
    data['image'] = this.image;
    data['icon'] = this.icon;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Brands {
  int? id;
  String? name;
  String? slug;
  String? logo;
  String? createdAt;
  String? updatedAt;

  Brands(
      {this.id,
      this.name,
      this.slug,
      this.logo,
      this.createdAt,
      this.updatedAt});

  Brands.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    logo = json['logo'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['logo'] = this.logo;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Products {
  int? id;
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
  String? createdAt;
  String? updatedAt;

  Products(
      {this.id,
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
      this.status,
      this.createdAt,
      this.updatedAt});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
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
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
