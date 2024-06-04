class StockItem {
  final String name;
  int quantity;

  StockItem({required this.name, this.quantity = 0});

  StockItem copyWith({String? name, int? quantity}) {
    return StockItem(
      name: name?? this.name,
      quantity: quantity?? this.quantity,
    );
  }
}