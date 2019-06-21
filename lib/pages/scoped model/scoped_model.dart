import 'package:scoped_model/scoped_model.dart';
import 'package:learn_flutter_dart/module/products_map.dart';


class ProductModel extends Model{

  List<ProductsMap> _products = [];
  List<ProductsMap> get products{
    return List.from(_products);
  }

  void addproduct(ProductsMap productsdata) {

      _products.add(productsdata);

  }

  void deleteprodcut(int index) {
    _products.removeAt(index);
  }

  void update(int index, ProductsMap product) {

      _products[index] = product;

  }
}