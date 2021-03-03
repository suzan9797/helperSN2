class Post {
  String product_name;
  String product_description;
  String price;
  String category;
  String user_id;

  Post(this.product_name, this.product_description, this.price, this.category,
      this.user_id);

  Post.fromJson(Map<String, dynamic> map) {
    this.product_name = map['product_name'];
    this.product_description = map['product_description'];
    this.price = map['price'];
    this.category = map['category'];
    this.user_id = map['user_id'];
  }

  Map<String, dynamic> toMap() {
    return {
      'product_name': this.product_name,
      'product_description': this.product_description,
      'price': this.price,
      'category': this.category,
      'user_id': this.user_id,
    };
  }
}
