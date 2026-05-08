import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruit_hub_dashboard/core/services/storage_service.dart';

class FireStorage implements StorageService {
  final storageReference = FirebaseStorage.instance;

  @override
  Future<String> uploadFila(String file) {
    // TODO: implement uploadFila
    throw UnimplementedError();
  }
}
