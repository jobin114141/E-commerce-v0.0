class CartModel {
  final int id;
  final String productName;
  double price;
  int quantity;
  CartModel(
      {required this.productName,
      required this.id,
      required this.price,
      this.quantity = 1});
}
