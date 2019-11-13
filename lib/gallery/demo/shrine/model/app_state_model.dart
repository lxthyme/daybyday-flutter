import 'package:flutter_hw/example/tutorial/ShoppingList.dart';
import 'package:scoped_model/scoped_model.dart';

class AppStateModel extends Model {
  List<Product> _availableProducts;

  void loadProducts() {}
}
