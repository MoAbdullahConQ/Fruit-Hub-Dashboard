import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failures.dart';
import 'package:fruit_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruit_hub_dashboard/core/services/database_service.dart';
import 'package:fruit_hub_dashboard/core/utils/backend_endpoints.dart';
import 'package:fruit_hub_dashboard/features/add_product/data/models/product_model.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/product_entity.dart';

class ProductRepoImpl implements ProductRepo {
  final DatabaseService databaseService;

  ProductRepoImpl(this.databaseService);

  @override
  Future<Either<Failure, void>> addProduct(ProductEntity entity) async {
    try {
      await databaseService.addData(
        path: BackendEndpoints.addProduct,
        data: ProductModel.fromEntity(entity).toJson(),
      );
      return right(null);
    } catch (e) {
      return left(ServerFailure('Failed to add product'));
    }
  }
}
