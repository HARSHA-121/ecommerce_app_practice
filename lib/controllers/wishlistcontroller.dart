import 'package:get/get.dart';
import 'package:my_app/models/product.dart';

class WishlistController extends GetxController {
  var wishlistItems = <Product, int>{}.obs;

  void addToWishlist(Product product) {
    if (wishlistItems.containsKey(product)) {
      wishlistItems[product] = wishlistItems[product]! + 1;
    } else {
      wishlistItems[product] = 1;
    }
    wishlistItems.refresh();
  }

  void toggleWishlist(Product product) {
    if (wishlistItems.containsKey(product)) {
      wishlistItems.remove(product);
    } else {
      wishlistItems[product] = 1;
    }
  }

  void removefromwishlist(Product product) {
    wishlistItems.remove(product);
  }

  bool isInWishlist(Product product) {
    return wishlistItems.containsKey(product);
  }
}
