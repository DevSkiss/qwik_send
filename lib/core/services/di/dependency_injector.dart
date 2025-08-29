import 'package:fanboost_mobile/app/app_config.dart';
import 'package:fanboost_mobile/core/router/app_router.dart';
import 'package:fanboost_mobile/core/services/cached_service.dart';
import 'package:fanboost_mobile/core/services/sembast_service.dart';
import 'package:fanboost_mobile/core/services/supabase_service.dart';
import 'package:fanboost_mobile/features/auth/auth_di.dart';
import 'package:fanboost_mobile/features/boosts/boosts_di.dart';
import 'package:fanboost_mobile/features/communication/communication_di.dart';
import 'package:fanboost_mobile/features/landing_page/presentation/common_landing_page/bloc/fan_landing_tutorial/fan_landing_tutorial_bloc.dart';
import 'package:fanboost_mobile/features/payments/payments_di.dart';
import 'package:fanboost_mobile/features/profile/profile_di.dart';
import 'package:fanboost_mobile/features/report_conversation/report_conversation_di.dart';
import 'package:fanboost_mobile/features/school_requests/school_requests_di.dart';
import 'package:fanboost_mobile/features/schools/schools_di.dart';
import 'package:fanboost_mobile/features/search/search_di.dart';
import 'package:fanboost_mobile/features/sports/sports_di.dart';
import 'package:fanboost_mobile/features/stripe/stripe_di.dart';
import 'package:fanboost_mobile/features/teams/teams_di.dart';
import 'package:fanboost_mobile/features/user_onboarding/user_onboarding_id.dart';
import 'package:fanboost_mobile/features/user_preferences/user_preferences_di.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:sembast/utils/sembast_import_export.dart';

final locator = GetIt.instance;

Future<void> init({required AppConfig config}) async {
  locator
    ..registerSingleton(AppRouter())
    ..registerLazySingleton(SupabaseService.new)
    ..registerLazySingleton<CachedService>(CachedServiceImpl.new)
    ..registerLazySingleton<FlutterSecureStorage>(FlutterSecureStorage.new)
    ..registerSingletonAsync<Database>(() => SembastDatabaseService().database)
    ..registerLazySingleton<FanLandingTutorialBloc>(
      () => FanLandingTutorialBloc(),
    )
  //
  ;
  authDI(locator);
  stripeDI(locator);
  userOnboardingID(locator);
  profileDI(locator);
  sportsDI(locator);
  schoolsDI(locator);
  teamsDI(locator);
  boostsDI(locator);
  userpreferencesDI(locator);
  searchDI(locator);
  communicationDI(locator);
  conversationReportsDI(locator);
  schoolRequestsDI(locator);
  paymentsDI(locator);
  await locator.allReady();
}
