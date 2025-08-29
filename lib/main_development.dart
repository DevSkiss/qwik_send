import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:quick_send/app/app.dart';
import 'package:quick_send/app/app_config.dart';
import 'package:quick_send/bootstrap.dart';
import 'package:quick_send/core/services/di/dependency_injector.dart' as di;

void main() async {
  await dotenv.load(fileName: '.env');
  await di.init(
    config: AppConfig(
      apiUrl: dotenv.env['API_URL'] ?? '',
      apikey: dotenv.env['API_KEY'] ?? '',
    ),
  );
  bootstrap(() => const App());
}
