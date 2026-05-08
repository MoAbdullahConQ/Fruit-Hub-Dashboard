import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/repos/images_repo/image_repo.dart';
import 'package:fruit_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/add_product_input_entity.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  final ImageRepo imageRepo;
  final ProductRepo productRepo;
  AddProductCubit(this.imageRepo, this.productRepo)
    : super(AddProductInitial());

  Future<void> addProduct(AddProductInputEntity addProductInputEntity) async {
    emit(AddProductLoading());

    // 1. first upload image
    var imageResult = await imageRepo.uploadImage(addProductInputEntity.image);

    imageResult.fold(
      (failure) {
        emit(AddProductFailure(failure.message));
      },
      (imageUrl) async {
        var result = await productRepo.addProduct(addProductInputEntity);
        result.fold(
          (failure) {
            emit(AddProductFailure(failure.message));
          },
          (right) {
            emit(AddProductSuccess());
          },
        );
      },
    );
  }
}
