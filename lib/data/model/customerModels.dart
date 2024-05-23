class CustomersModel {
  int? customersId;
  String? customersImage;
  String? customersName;
  String? customersNameAr;
  String? customersCategory;
  String? customersCategoryAr;
  String? customersDatetime;

  CustomersModel(
      {this.customersId,
        this.customersImage,
        this.customersName,
        this.customersNameAr,
        this.customersCategory,
        this.customersCategoryAr,
        this.customersDatetime});

  CustomersModel.fromJson(Map<String, dynamic> json) {
    customersId = json['customers_id'];
    customersImage = json['customers_image'];
    customersName = json['customers_name'];
    customersNameAr = json['customers_name_ar'];
    customersCategory = json['customers_category'];
    customersCategoryAr = json['customers_category_ar'];
    customersDatetime = json['customers_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customers_id'] = this.customersId;
    data['customers_image'] = this.customersImage;
    data['customers_name'] = this.customersName;
    data['customers_name_ar'] = this.customersNameAr;
    data['customers_category'] = this.customersCategory;
    data['customers_category_ar'] = this.customersCategoryAr;
    data['customers_datetime'] = this.customersDatetime;
    return data;
  }
}