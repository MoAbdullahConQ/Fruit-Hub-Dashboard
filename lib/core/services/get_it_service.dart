import 'package:fruit_hub_dashboard/core/repos/images_repo/image_repo.dart';
import 'package:fruit_hub_dashboard/core/repos/images_repo/image_repo_impl.dart';
import 'package:fruit_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruit_hub_dashboard/core/repos/product_repo/product_repo_impl.dart';
import 'package:fruit_hub_dashboard/core/services/fire_storage.dart';
import 'package:fruit_hub_dashboard/core/services/storage_service.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<StorageService>(FireStorage());

  getIt.registerSingleton<ImageRepo>(ImageRepoImpl(getIt<StorageService>()));

  getIt.registerSingleton<ProductRepo>(ProductRepoImpl());
}
