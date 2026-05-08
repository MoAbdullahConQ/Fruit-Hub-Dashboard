import 'package:fruit_hub_dashboard/features/add_product/domain/add_product_input_entity.dart';

abstract class ProductRepo {
  Future<void> addProduct(AddProductInputEntity addProductInputEntity);
}
