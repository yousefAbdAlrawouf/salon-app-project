import 'dart:io';

class AddNewProductparams {
  final String englishName;
  final String enDescreption;
  final String arName;
  final String arDescreption;
  final String price;
  final String discountPrice;
  final String categoryId;
  final String deliveryFee;
  final File image;

  AddNewProductparams(
      {required this.englishName,
      required this.enDescreption,
      required this.arName,
      required this.arDescreption,
      required this.price,
      required this.discountPrice,
      required this.categoryId,
      required this.deliveryFee,
      required this.image});

  Map<String, String> toJson() {
    return {
      'en[name]': englishName,
      'en[description]': enDescreption,
      'ar[name]': arName,
      'ar[description]': arDescreption,
      'price': price,
      'discount_price': discountPrice,
      'category_id': categoryId,
      'delivery_fee': deliveryFee,
    };
  }
}
