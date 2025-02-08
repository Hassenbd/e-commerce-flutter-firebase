class Product {
  String name;
  String price;
  String location;
  String description;
  String category;
  String pId = " ";

  Product(
      this.name, this.category, this.price, this.location, this.description);
  void setId(id) {
    pId = id;
  }
}
