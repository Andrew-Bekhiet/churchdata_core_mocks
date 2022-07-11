// ignore_for_file: implementation_imports

import 'package:churchdata_core/churchdata_core.dart';
import 'package:firebase_storage_mocks/firebase_storage_mocks.dart' as s;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'mock_storage_reference.mocks.dart';

@GenerateMocks([Reference])
class MockFirebaseStorage extends s.MockFirebaseStorage {
  @override
  MockReference ref([String? path]) {
    path ??= '/';

    final mockReference = MockReference();
    when(mockReference.fullPath).thenReturn(path);
    when(mockReference.name).thenReturn(path.split('/').last);

    return mockReference;
  }
}
