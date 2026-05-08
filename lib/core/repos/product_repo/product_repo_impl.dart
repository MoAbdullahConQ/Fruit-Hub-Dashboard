import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failures.dart';
import 'package:fruit_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/add_product_input_entity.dart';

class ProductRepoImpl implements ProductRepo {
  @override
  Future<Either<Failure, void>> addProduct(
    AddProductInputEntity addProductInputEntity,
  ) {
    // TODO: implement addProduct
    throw UnimplementedError();
  }
}
