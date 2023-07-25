import 'package:mobis_pss_app/core/environment/base_config/base_config.dart';
import 'package:mobis_pss_app/core/environment/base_config/dev_config.dart';
import 'package:mobis_pss_app/core/environment/base_config/local_config.dart';
import 'package:mobis_pss_app/core/environment/base_config/prod_config.dart';

class Environment {
  factory Environment() {
    return _singleton;
  }

  Environment._internal();

  static final Environment _singleton = Environment._internal();

  static const String LOCAL = 'LOCAL';
  static const String DEV = 'DEV';
  static const String PROD = 'PROD';

  late BaseConfig config;
  late String serverType;

  initConfig(String environment) {
    config = _getConfig(environment);
  }

  BaseConfig _getConfig(String environment) {
    //서버 타입 저장
    serverType = environment;

    switch (environment) {
      case Environment.PROD:
        return ProdConfig();
      case Environment.DEV:
        return DevConfig();
      default:
        return LocalConfig();
    }
  }
}
