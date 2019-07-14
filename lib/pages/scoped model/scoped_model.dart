import 'package:scoped_model/scoped_model.dart';
import 'package:learn_flutter_dart/module/products_map.dart';

class ProductModel extends Model {
  List<ProductsMap> _products = [];
  bool _showFavorite = false;

  List<ProductsMap> get products {
    return List.from(_products);
  }

  List<ProductsMap>get dispalyedproduct{
    if(_showFavorite){
    return _products.where((ProductsMap product){product.isFavorite;}).toList();
    }
    return List.from(_products);
  }

  void showDisply(){
    _showFavorite = !_showFavorite;
    notifyListeners();
  }

  bool get onlyFavorites{
    return _showFavorite;
  }


  int _selectedProductIndex;
  void addproduct(ProductsMap productsdata) {
    _products.add(productsdata);
    _selectedProductIndex = null;
    notifyListeners();
  }

  void deleteprodcut() {
    _products.removeAt(_selectedProductIndex);
    _selectedProductIndex = null;
    notifyListeners();
  }

  int get selectedProductReturn {
    return _selectedProductIndex;
  }

  ProductsMap get selectedProduct {
    if (_selectedProductIndex == null) {
      return null;
    }
    return _products[_selectedProductIndex];
  }

  void update(ProductsMap product) {
    _products[_selectedProductIndex] = product;
    _selectedProductIndex = null;
    notifyListeners();
  }

  void selectedIndex(int index) {
    _selectedProductIndex = index;
    notifyListeners();
  }

  void toggleProductFavoriteStatus() {
    notifyListeners();
    final bool isCurrentFavorite = selectedProduct.isFavorite;
    final bool newFavorite = !isCurrentFavorite;
    final ProductsMap updateProduct = ProductsMap(
        title: selectedProduct.title,
        dec: selectedProduct.dec,
        price: selectedProduct.price,
        image: selectedProduct.image,
        isFavorite: newFavorite
    );
    _products[selectedProductReturn] =updateProduct;
    selectedProductReturn ==null;

  }

}
