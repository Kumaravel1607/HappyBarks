class ProductListResponse {
  bool? status;
  ProductResponseData? responseData;
  String? responseMessage;

  ProductListResponse({this.status, this.responseData, this.responseMessage});

  ProductListResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    responseData = json['response_data'] != null
        ? new ProductResponseData.fromJson(json['response_data'])
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

class ProductResponseData {
  int? currentPage;
  List<ProductListData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  ProductResponseData(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  ProductResponseData.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <ProductListData>[];
      json['data'].forEach((v) {
        data!.add(new ProductListData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class ProductListData {
  int? id;
  int? categoryId;
  int? subcategoryId;
  int? brandId;
  String? name;
  dynamic petBread;
  dynamic breadType;
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
  dynamic age;
  dynamic gender;
  dynamic vetConsultation;
  dynamic breedTitle;
  dynamic breedDescription;
  dynamic breedFacts;
  dynamic breedFactsDescription;
  dynamic familyLife;
  dynamic physical;
  dynamic social;
  dynamic personality;
  dynamic allTraits;
  dynamic identifyingRightBreedTitle;
  dynamic identifyingRightBreedDesc;
  dynamic aboutPuppy;
  dynamic vaccinationPuppy;
  dynamic covered;
  dynamic mealTitle;
  dynamic mealDesc;
  dynamic buyingProcess;
  dynamic images;
  dynamic discount;
  dynamic isFeatured;
  int? status;
  String? createdAt;
  String? updatedAt;

  ProductListData(
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

  ProductListData.fromJson(Map<String, dynamic> json) {
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

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}
