
class Product {
  final double? avgRating;
  final String? brandName;
  final String? description;
  final int? price;
  final int? size;
  final String? totalRating;
  final String? brandIcon;
  final String? id;
  final String? imageLarge;
  final String? imageSmall;
  final String? name;
  final int? quantity;

  Product(
      {this.avgRating,
      this.brandName,
      this.description,
      this.price,
      this.size,
      this.totalRating,
      this.brandIcon,
      this.id,
      this.imageLarge,
      this.imageSmall,
      this.name,
      this.quantity});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      avgRating: json['Avg_Rating'].toDouble(),
      brandName: json['Brand_Name'],
      description: json['Description'],
      price: json['Price'],
      size: json['Size'],
      totalRating: json['Total_Rating'],
      brandIcon: json['brand_icon'],
      id: json['id'],
      imageLarge: json['image_Large'],
      imageSmall: json['image_small'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Avg_Rating': avgRating,
      'Brand_Name': brandName,
      'Description': description,
      'Price': price,
      'Size': size,
      'Total_Rating': totalRating,
      'brand_icon': brandIcon,
      'id': id,
      'image_Large': imageLarge,
      'image_small': imageSmall,
      'name': name,
    };
  }
    Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'brandName': brandName,
      'size': size,
      'price': price,
      'imageSmall': imageSmall,
    };
  }
}
