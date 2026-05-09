import 'dart:io';

import 'package:fruit_hub_dashboard/core/services/storage_service.dart';
import 'package:path/path.dart' as b;
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageService implements StorageService {


  final _supabase = Supabase.instance.client;

  @override
  Future<String> uploadFile(File file, String path) async {
    final String fileName = b.basename(file.path);
    final String extensionName = b.extension(file.path);
    final String filePath = '$path/$fileName$extensionName';

    await _supabase.storage.from('fruits_images').upload(filePath, file);

    final String imageUrl = _supabase.storage
        .from('fruits_images')
        .getPublicUrl(filePath);

    return imageUrl;
  }
}
