// ignore_for_file: implementation_imports

import 'package:firebase_storage_mocks/firebase_storage_mocks.dart' as s;
import 'package:firebase_storage_mocks/src/mock_storage_reference.dart';

class MockFirebaseStorage extends s.MockFirebaseStorage {
  @override
  MockReference ref([String? path]) {
    path ??= '/';
    return MockReference(this, path);
  }
}
