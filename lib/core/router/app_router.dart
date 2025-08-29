import 'package:auto_route/auto_route.dart';
import 'package:quick_send/features/auth/presentation/screens/auth_screen.dart';
import 'package:quick_send/features/home/presentation/screens/home_screen.dart';
import 'package:quick_send/features/layout/presentation/screens/layout.dart';
import 'package:quick_send/features/send_money/presentation/screens/send_money.dart';
import 'package:quick_send/features/transaction/presentation/screens/transaction_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: AuthRoute.page, path: '/auth', initial: true),
    AutoRoute(
      page: LayoutRoute.page,
      path: '/layout',
      children: [
        AutoRoute(page: HomeRoute.page, path: 'home', initial: true),
        AutoRoute(page: SendMoneyRoute.page, path: 'send'),
        AutoRoute(page: TransactionRoute.page, path: 'transaction'),
      ],
    ),
  ];

  @override
  List<AutoRouteGuard> get guards => [
    // optionally add root guards here
  ];
}
