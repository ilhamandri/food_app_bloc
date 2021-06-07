class Product {
  final int id;
  final String title;
  final String description;
  final String image;
  final int price;
  final int qty;

  Product({
    this.id,
    this.title,
    this.description,
    this.image,
    this.price,
    this.qty,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      price: json['price'],
      qty: json['qty']);
}
