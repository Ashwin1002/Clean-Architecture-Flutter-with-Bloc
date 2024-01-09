import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:medhavi_app/core/di/injection.config.dart';

///
///Dependency Injection Cannot be done with classes with constructors
///
final GetIt getIt = GetIt.instance;

@injectableInit
Future<void> configureInjection() async {
  getIt.init();
}
