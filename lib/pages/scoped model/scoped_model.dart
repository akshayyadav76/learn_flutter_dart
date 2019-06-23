import 'package:scoped_model/scoped_model.dart';
import 'package:learn_flutter_dart/module/products_map.dart';


class ProductModel extends Model{

  List<ProductsMap> _products = [];
  List<ProductsMap> get products{
    return List.from(_products);
  }
  int _selectedProductIndex;

  void addproduct(ProductsMap productsdata) {

      _products.add(productsdata);
      _selectedProductIndex = null;

  }

  void deleteprodcut() {
    _products.removeAt(_selectedProductIndex);
    _selectedProductIndex = null;
  }

  int get selectedProductReturn{
   return _selectedProductIndex;
  }

  ProductsMap get selectedProduct{
    if(_selectedProductIndex == null){
      return null;
    }
    return _products[_selectedProductIndex];
  }

  void update( ProductsMap product) {

      _products[_selectedProductIndex] = product;
      _selectedProductIndex = null;

  }
  void selectedIndex(int index){
    _selectedProductIndex = index;
  }
}