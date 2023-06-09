import '../data/contact_data.dart';
import '../data/contact_data_impl.dart';
import '../data/contact_data_mock.dart';

enum Flavor { mock, prod }

/// Simple DI
class Injector {
  static final Injector _singleton = Injector._internal();
  static late Flavor _flavor;

  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  ContactRepository get contactRepository {
    switch (_flavor) {
      case Flavor.mock:
        return MockContactRepository();
      default: // Flavor.PRO:
        return RandomUserRepository();
    }
  }
}
