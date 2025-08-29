//
// ignore_for_file: inference_failure_on_instance_creation

import 'package:auto_route/auto_route.dart';
import 'package:fanboost_mobile/core/router/app_router.gr.dart';
import 'package:flutter/material.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, path: '/splash', initial: true),
    // CustomRoute(
    //   page: PhoneAuthenticationRoute.page,
    //   path: '/phone-auth',
    //   transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //     return FadeTransition(opacity: animation, child: child);
    //   },
    // ),
    CustomRoute(
      page: AuthenticationRoute.page,
      path: '/auth',
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    ),
    CustomRoute(
      page: PasswordResetRoute.page,
      path: '/password-reset',
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    ),
    AutoRoute(page: FanLandingRoute.page, path: '/landing'),
    AutoRoute(page: AthleteLandingRoute.page, path: '/athlete-landing'),
    AutoRoute(
      page: ProfileRoute.page,
      path: '/profile',
      children: [
        AutoRoute(
          page: EditProfileRoute.page,
          path: 'edit-profile',
          initial: true,
        ),
        AutoRoute(page: FollowSportsRoute.page, path: 'follow-sports'),
        AutoRoute(page: ChangePasswordRoute.page, path: 'change-password'),
        AutoRoute(page: UpdateEmailRoute.page, path: 'change-email'),
        AutoRoute(page: UpdatePhoneRoute.page, path: 'change-phone'),
      ],
    ),
    AutoRoute(
      page: PaymentsRoute.page,
      path: '/payments',
      children: [
        AutoRoute(page: PaymentMethodsListRoute.page, initial: true),
        AutoRoute(page: AddPaymentMethodRoute.page, path: 'add-payment'),
        AutoRoute(page: EditPaymentMethodRoute.page, path: 'edit-payment'),
      ],
    ),
    AutoRoute(
      page: MessagesRoute.page,
      path: '/conversations',
      children: [
        AutoRoute(page: ConversationsListRoute.page, initial: true),
        AutoRoute(page: ConversationRoute.page, path: ':conversationId'),
      ],
    ),
    AutoRoute(
      page: UserOnboardingRoute.page,
      path: '/signup',
      children: [
        AutoRoute(page: RegistrationRoute.page, path: 'create-user'),
        AutoRoute(
          page: IdentityVerificationRoute.page,
          path: 'id-verification',
        ),
        AutoRoute(page: FollowSportsRoute.page, path: 'follow-sports'),
        AutoRoute(page: FollowSchoolsRoute.page, path: 'follow-schools'),
        AutoRoute(
          page: OnboardingAddPaymentMethodRoute.page,
          path: 'add-payment',
        ),
      ],
    ),
    CustomRoute(
      page: BoostingRoute.page,
      path: '/boosting',
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
      children: [
        AutoRoute(page: BoostingCustomizeRoute.page, path: 'custom'),
        AutoRoute(page: BoostingConfirmRoute.page, path: 'confirm'),
        AutoRoute(page: BoostingSuccessRoute.page, path: 'completed'),
      ],
    ),
    AutoRoute(page: TeamSearchRoute.page, path: '/team-search'),
    AutoRoute(page: TeamProfileRoute.page, path: '/team/:schoolId'),
    AutoRoute(
      page: ReportConversationRoute.page,
      path: '/report-conversation',
      children: [
        AutoRoute(page: ReportConversationFormRoute.page, initial: true),
        AutoRoute(page: ReportConversationCompletedRoute.page, path: 'success'),
      ],
    ),
    AutoRoute(
      page: RequestSchoolRoute.page,
      path: '/request-school',
      children: [
        AutoRoute(page: SchoolRequestFormRoute.page, initial: true),
        AutoRoute(page: SchoolRequestCompletedRoute.page, path: 'success'),
      ],
    ),
  ];

  @override
  List<AutoRouteGuard> get guards => [
    // optionally add root guards here
  ];
}
