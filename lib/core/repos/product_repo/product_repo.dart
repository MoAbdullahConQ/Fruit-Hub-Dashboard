import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failures.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/product_entity.dart';

abstract class ProductRepo {
  Future<Either<Failure, void>> addProduct(
    ProductEntity addProductInputEntity,
  );
}
