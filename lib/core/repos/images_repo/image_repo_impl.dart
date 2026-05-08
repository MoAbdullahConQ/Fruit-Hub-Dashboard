import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failures.dart';
import 'package:fruit_hub_dashboard/core/repos/images_repo/image_repo.dart';

class ImageRepoImpl implements ImageRepo {
  @override
  Future<Either<Failure, String>> uploadImage(File image) {
    // TODO: implement uploadImage
    throw UnimplementedError();
  }
}
