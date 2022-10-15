class ProductModel {
  final int id;
  final String name;
  final String image;
  final dynamic price;
  final dynamic oldPrice;
  final dynamic discount;
  final String details;
  bool isFavourite = false;
  bool inCart = false;
  int quantity;
  final List<String> imageList;
  final double rate;
  final List<Review> review;

  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.details,
    required this.isFavourite,
    required this.quantity,
    required this.inCart,
    required this.imageList,
    required this.rate,
    required this.review,
  });
}

class Review {
  final String image;
  final String name;
  final double rate;
  final String review;
  final String date;

  Review({
    required this.name,
    required this.image,
    required this.rate,
    required this.review,
    required this.date,
  });
}
