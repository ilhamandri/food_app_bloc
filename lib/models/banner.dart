class Banner {
  final int id;
  final String title;
  final String description;
  final String image;

  Banner({
    this.id,
    this.title,
    this.description,
    this.image,
  });

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        image: json['image'],
      );
}
