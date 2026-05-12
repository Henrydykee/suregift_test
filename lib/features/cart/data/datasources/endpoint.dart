class CartEndpoints {
  static const String cart = 'api/cart';
  static const String items = 'api/cart/items';
  static const String total = 'api/cart/total';

  static String itemById(int cartItemId) => 'api/cart/items/$cartItemId';
}

