import 'package:churchdata_core/churchdata_core.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:mockito/mockito.dart';

class FakeFunctionsRepo extends Fake implements FunctionsService {}

class FakeHttpsCallable extends Mock implements HttpsCallable {
  @override
  Future<HttpsCallableResult<T>> call<T>([p]) =>
      // ignore: invalid_use_of_visible_for_testing_member
      super.noSuchMethod(Invocation.method(#call, [p]),
          returnValue: Future.value(FakeHttpsCallableResult<T>()));
}

class FakeHttpsCallableResult<T> extends Mock
    implements HttpsCallableResult<T> {
  @override
  // ignore: invalid_use_of_visible_for_testing_member
  T get data => super.noSuchMethod(
        Invocation.getter(#data),
      );
}
