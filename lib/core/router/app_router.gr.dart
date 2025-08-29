// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i34;
import 'package:fanboost_mobile/features/athletes/domain/entities/athlete.dart'
    as _i37;
import 'package:fanboost_mobile/features/auth/presentation/screens/authentication_page.dart'
    as _i3;
import 'package:fanboost_mobile/features/auth/presentation/screens/password_reset/new_password_form.dart'
    as _i17;
import 'package:fanboost_mobile/features/auth/presentation/screens/password_reset/password_reset_page.dart'
    as _i19;
import 'package:fanboost_mobile/features/boosts/presentation/screens/boosting_confirm_screen.dart'
    as _i4;
import 'package:fanboost_mobile/features/boosts/presentation/screens/boosting_customize_screen.dart'
    as _i5;
import 'package:fanboost_mobile/features/boosts/presentation/screens/boosting_page.dart'
    as _i6;
import 'package:fanboost_mobile/features/boosts/presentation/screens/boosting_success_screen.dart'
    as _i7;
import 'package:fanboost_mobile/features/communication/presentation/screens/conversation_page.dart'
    as _i9;
import 'package:fanboost_mobile/features/communication/presentation/screens/messages_page.dart'
    as _i10;
import 'package:fanboost_mobile/features/landing_page/presentation/athlete_landing/screens/athlete_landing_page.dart'
    as _i2;
import 'package:fanboost_mobile/features/landing_page/presentation/common_landing_page/screens/fan_landing_page.dart'
    as _i13;
import 'package:fanboost_mobile/features/payments/presentation/screens/add_payment_method_page.dart'
    as _i1;
import 'package:fanboost_mobile/features/payments/presentation/screens/edit_payment_method_page.dart'
    as _i11;
import 'package:fanboost_mobile/features/payments/presentation/screens/payments_page.dart'
    as _i20;
import 'package:fanboost_mobile/features/profile/presentation/screens/change_password_page.dart'
    as _i8;
import 'package:fanboost_mobile/features/profile/presentation/screens/profile_page.dart'
    as _i12;
import 'package:fanboost_mobile/features/profile/presentation/screens/update_email_page.dart'
    as _i31;
import 'package:fanboost_mobile/features/profile/presentation/screens/update_phone_page.dart'
    as _i32;
import 'package:fanboost_mobile/features/report_conversation/presentation/screens/report_conversation_completed_page.dart'
    as _i22;
import 'package:fanboost_mobile/features/report_conversation/presentation/screens/report_conversation_form_page.dart'
    as _i23;
import 'package:fanboost_mobile/features/report_conversation/presentation/screens/report_conversation_page.dart'
    as _i24;
import 'package:fanboost_mobile/features/school_requests/presentation/screens/request_school_page.dart'
    as _i25;
import 'package:fanboost_mobile/features/school_requests/presentation/screens/school_request_completed_page.dart'
    as _i26;
import 'package:fanboost_mobile/features/school_requests/presentation/screens/school_request_form_page.dart'
    as _i27;
import 'package:fanboost_mobile/features/search/presentation/screens/team_search_page.dart'
    as _i30;
import 'package:fanboost_mobile/features/splash/screens/splash_screen.dart'
    as _i28;
import 'package:fanboost_mobile/features/stripe/domain/entities/payment_card.dart'
    as _i38;
import 'package:fanboost_mobile/features/teams/domain/entities/team.dart'
    as _i36;
import 'package:fanboost_mobile/features/teams/presentation/screens/team_profile_page.dart'
    as _i29;
import 'package:fanboost_mobile/features/user_onboarding/presentation/screens/follow_schools_page.dart'
    as _i14;
import 'package:fanboost_mobile/features/user_onboarding/presentation/screens/follow_sports_page.dart'
    as _i15;
import 'package:fanboost_mobile/features/user_onboarding/presentation/screens/identity_verification_page.dart'
    as _i16;
import 'package:fanboost_mobile/features/user_onboarding/presentation/screens/onboarding_add_payment_method_page.dart'
    as _i18;
import 'package:fanboost_mobile/features/user_onboarding/presentation/screens/registration_page.dart'
    as _i21;
import 'package:fanboost_mobile/features/user_onboarding/presentation/screens/user_onboarding_page.dart'
    as _i33;
import 'package:flutter/material.dart' as _i35;

/// generated route for
/// [_i1.AddPaymentMethodPage]
class AddPaymentMethodRoute
    extends _i34.PageRouteInfo<AddPaymentMethodRouteArgs> {
  AddPaymentMethodRoute({
    _i35.Key? key,
    void Function()? onDone,
    bool initialSetAsDefault = false,
    bool disableDefaultToggle = false,
    List<_i34.PageRouteInfo>? children,
  }) : super(
         AddPaymentMethodRoute.name,
         args: AddPaymentMethodRouteArgs(
           key: key,
           onDone: onDone,
           initialSetAsDefault: initialSetAsDefault,
           disableDefaultToggle: disableDefaultToggle,
         ),
         initialChildren: children,
       );

  static const String name = 'AddPaymentMethodRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddPaymentMethodRouteArgs>(
        orElse: () => const AddPaymentMethodRouteArgs(),
      );
      return _i1.AddPaymentMethodPage(
        key: args.key,
        onDone: args.onDone,
        initialSetAsDefault: args.initialSetAsDefault,
        disableDefaultToggle: args.disableDefaultToggle,
      );
    },
  );
}

class AddPaymentMethodRouteArgs {
  const AddPaymentMethodRouteArgs({
    this.key,
    this.onDone,
    this.initialSetAsDefault = false,
    this.disableDefaultToggle = false,
  });

  final _i35.Key? key;

  final void Function()? onDone;

  final bool initialSetAsDefault;

  final bool disableDefaultToggle;

  @override
  String toString() {
    return 'AddPaymentMethodRouteArgs{key: $key, onDone: $onDone, initialSetAsDefault: $initialSetAsDefault, disableDefaultToggle: $disableDefaultToggle}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AddPaymentMethodRouteArgs) return false;
    return key == other.key &&
        initialSetAsDefault == other.initialSetAsDefault &&
        disableDefaultToggle == other.disableDefaultToggle;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      initialSetAsDefault.hashCode ^
      disableDefaultToggle.hashCode;
}

/// generated route for
/// [_i2.AthleteLandingPage]
class AthleteLandingRoute extends _i34.PageRouteInfo<void> {
  const AthleteLandingRoute({List<_i34.PageRouteInfo>? children})
    : super(AthleteLandingRoute.name, initialChildren: children);

  static const String name = 'AthleteLandingRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i2.AthleteLandingPage();
    },
  );
}

/// generated route for
/// [_i3.AuthenticationPage]
class AuthenticationRoute extends _i34.PageRouteInfo<AuthenticationRouteArgs> {
  AuthenticationRoute({
    _i35.Key? key,
    _i3.AuthPageView initialView = _i3.AuthPageView.phoneLogin,
    List<_i34.PageRouteInfo>? children,
  }) : super(
         AuthenticationRoute.name,
         args: AuthenticationRouteArgs(key: key, initialView: initialView),
         initialChildren: children,
       );

  static const String name = 'AuthenticationRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AuthenticationRouteArgs>(
        orElse: () => const AuthenticationRouteArgs(),
      );
      return _i3.AuthenticationPage(
        key: args.key,
        initialView: args.initialView,
      );
    },
  );
}

class AuthenticationRouteArgs {
  const AuthenticationRouteArgs({
    this.key,
    this.initialView = _i3.AuthPageView.phoneLogin,
  });

  final _i35.Key? key;

  final _i3.AuthPageView initialView;

  @override
  String toString() {
    return 'AuthenticationRouteArgs{key: $key, initialView: $initialView}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AuthenticationRouteArgs) return false;
    return key == other.key && initialView == other.initialView;
  }

  @override
  int get hashCode => key.hashCode ^ initialView.hashCode;
}

/// generated route for
/// [_i4.BoostingConfirmScreen]
class BoostingConfirmRoute extends _i34.PageRouteInfo<void> {
  const BoostingConfirmRoute({List<_i34.PageRouteInfo>? children})
    : super(BoostingConfirmRoute.name, initialChildren: children);

  static const String name = 'BoostingConfirmRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i4.BoostingConfirmScreen();
    },
  );
}

/// generated route for
/// [_i5.BoostingCustomizeScreen]
class BoostingCustomizeRoute extends _i34.PageRouteInfo<void> {
  const BoostingCustomizeRoute({List<_i34.PageRouteInfo>? children})
    : super(BoostingCustomizeRoute.name, initialChildren: children);

  static const String name = 'BoostingCustomizeRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i5.BoostingCustomizeScreen();
    },
  );
}

/// generated route for
/// [_i6.BoostingPage]
class BoostingRoute extends _i34.PageRouteInfo<BoostingRouteArgs> {
  BoostingRoute({
    required _i36.Team team,
    required _i37.Athlete player,
    _i35.Key? key,
    bool isCustom = false,
    double? amount,
    bool canMessageOverride = false,
    List<_i34.PageRouteInfo>? children,
  }) : super(
         BoostingRoute.name,
         args: BoostingRouteArgs(
           team: team,
           player: player,
           key: key,
           isCustom: isCustom,
           amount: amount,
           canMessageOverride: canMessageOverride,
         ),
         initialChildren: children,
       );

  static const String name = 'BoostingRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<BoostingRouteArgs>();
      return _i6.BoostingPage(
        team: args.team,
        player: args.player,
        key: args.key,
        isCustom: args.isCustom,
        amount: args.amount,
        canMessageOverride: args.canMessageOverride,
      );
    },
  );
}

class BoostingRouteArgs {
  const BoostingRouteArgs({
    required this.team,
    required this.player,
    this.key,
    this.isCustom = false,
    this.amount,
    this.canMessageOverride = false,
  });

  final _i36.Team team;

  final _i37.Athlete player;

  final _i35.Key? key;

  final bool isCustom;

  final double? amount;

  final bool canMessageOverride;

  @override
  String toString() {
    return 'BoostingRouteArgs{team: $team, player: $player, key: $key, isCustom: $isCustom, amount: $amount, canMessageOverride: $canMessageOverride}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! BoostingRouteArgs) return false;
    return team == other.team &&
        player == other.player &&
        key == other.key &&
        isCustom == other.isCustom &&
        amount == other.amount &&
        canMessageOverride == other.canMessageOverride;
  }

  @override
  int get hashCode =>
      team.hashCode ^
      player.hashCode ^
      key.hashCode ^
      isCustom.hashCode ^
      amount.hashCode ^
      canMessageOverride.hashCode;
}

/// generated route for
/// [_i7.BoostingSuccessScreen]
class BoostingSuccessRoute extends _i34.PageRouteInfo<void> {
  const BoostingSuccessRoute({List<_i34.PageRouteInfo>? children})
    : super(BoostingSuccessRoute.name, initialChildren: children);

  static const String name = 'BoostingSuccessRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i7.BoostingSuccessScreen();
    },
  );
}

/// generated route for
/// [_i8.ChangePasswordPage]
class ChangePasswordRoute extends _i34.PageRouteInfo<void> {
  const ChangePasswordRoute({List<_i34.PageRouteInfo>? children})
    : super(ChangePasswordRoute.name, initialChildren: children);

  static const String name = 'ChangePasswordRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i8.ChangePasswordPage();
    },
  );
}

/// generated route for
/// [_i9.ConversationPage]
class ConversationRoute extends _i34.PageRouteInfo<ConversationRouteArgs> {
  ConversationRoute({
    required _i35.Key? key,
    required String conversationId,
    List<_i34.PageRouteInfo>? children,
  }) : super(
         ConversationRoute.name,
         args: ConversationRouteArgs(key: key, conversationId: conversationId),
         rawPathParams: {'conversationId': conversationId},
         initialChildren: children,
       );

  static const String name = 'ConversationRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ConversationRouteArgs>();
      return _i9.ConversationPage(
        key: args.key,
        conversationId: args.conversationId,
      );
    },
  );
}

class ConversationRouteArgs {
  const ConversationRouteArgs({
    required this.key,
    required this.conversationId,
  });

  final _i35.Key? key;

  final String conversationId;

  @override
  String toString() {
    return 'ConversationRouteArgs{key: $key, conversationId: $conversationId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ConversationRouteArgs) return false;
    return key == other.key && conversationId == other.conversationId;
  }

  @override
  int get hashCode => key.hashCode ^ conversationId.hashCode;
}

/// generated route for
/// [_i10.ConversationsListPage]
class ConversationsListRoute extends _i34.PageRouteInfo<void> {
  const ConversationsListRoute({List<_i34.PageRouteInfo>? children})
    : super(ConversationsListRoute.name, initialChildren: children);

  static const String name = 'ConversationsListRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i10.ConversationsListPage();
    },
  );
}

/// generated route for
/// [_i11.EditPaymentMethodPage]
class EditPaymentMethodRoute
    extends _i34.PageRouteInfo<EditPaymentMethodRouteArgs> {
  EditPaymentMethodRoute({
    _i35.Key? key,
    required _i38.PaymentCard card,
    void Function()? onChanged,
    List<_i34.PageRouteInfo>? children,
  }) : super(
         EditPaymentMethodRoute.name,
         args: EditPaymentMethodRouteArgs(
           key: key,
           card: card,
           onChanged: onChanged,
         ),
         initialChildren: children,
       );

  static const String name = 'EditPaymentMethodRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EditPaymentMethodRouteArgs>();
      return _i11.EditPaymentMethodPage(
        key: args.key,
        card: args.card,
        onChanged: args.onChanged,
      );
    },
  );
}

class EditPaymentMethodRouteArgs {
  const EditPaymentMethodRouteArgs({
    this.key,
    required this.card,
    this.onChanged,
  });

  final _i35.Key? key;

  final _i38.PaymentCard card;

  final void Function()? onChanged;

  @override
  String toString() {
    return 'EditPaymentMethodRouteArgs{key: $key, card: $card, onChanged: $onChanged}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EditPaymentMethodRouteArgs) return false;
    return key == other.key && card == other.card;
  }

  @override
  int get hashCode => key.hashCode ^ card.hashCode;
}

/// generated route for
/// [_i12.EditProfilePage]
class EditProfileRoute extends _i34.PageRouteInfo<void> {
  const EditProfileRoute({List<_i34.PageRouteInfo>? children})
    : super(EditProfileRoute.name, initialChildren: children);

  static const String name = 'EditProfileRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i12.EditProfilePage();
    },
  );
}

/// generated route for
/// [_i13.FanLandingPage]
class FanLandingRoute extends _i34.PageRouteInfo<FanLandingRouteArgs> {
  FanLandingRoute({
    _i35.Key? key,
    String? initialTeamId,
    String? initialPlayerId,
    List<_i34.PageRouteInfo>? children,
  }) : super(
         FanLandingRoute.name,
         args: FanLandingRouteArgs(
           key: key,
           initialTeamId: initialTeamId,
           initialPlayerId: initialPlayerId,
         ),
         rawQueryParams: {
           'initialTeamId': initialTeamId,
           'initialPlayerId': initialPlayerId,
         },
         initialChildren: children,
       );

  static const String name = 'FanLandingRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      final queryParams = data.queryParams;
      final args = data.argsAs<FanLandingRouteArgs>(
        orElse: () => FanLandingRouteArgs(
          initialTeamId: queryParams.optString('initialTeamId'),
          initialPlayerId: queryParams.optString('initialPlayerId'),
        ),
      );
      return _i13.FanLandingPage(
        key: args.key,
        initialTeamId: args.initialTeamId,
        initialPlayerId: args.initialPlayerId,
      );
    },
  );
}

class FanLandingRouteArgs {
  const FanLandingRouteArgs({
    this.key,
    this.initialTeamId,
    this.initialPlayerId,
  });

  final _i35.Key? key;

  final String? initialTeamId;

  final String? initialPlayerId;

  @override
  String toString() {
    return 'FanLandingRouteArgs{key: $key, initialTeamId: $initialTeamId, initialPlayerId: $initialPlayerId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! FanLandingRouteArgs) return false;
    return key == other.key &&
        initialTeamId == other.initialTeamId &&
        initialPlayerId == other.initialPlayerId;
  }

  @override
  int get hashCode =>
      key.hashCode ^ initialTeamId.hashCode ^ initialPlayerId.hashCode;
}

/// generated route for
/// [_i14.FollowSchoolsPage]
class FollowSchoolsRoute extends _i34.PageRouteInfo<void> {
  const FollowSchoolsRoute({List<_i34.PageRouteInfo>? children})
    : super(FollowSchoolsRoute.name, initialChildren: children);

  static const String name = 'FollowSchoolsRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i14.FollowSchoolsPage();
    },
  );
}

/// generated route for
/// [_i15.FollowSportsPage]
class FollowSportsRoute extends _i34.PageRouteInfo<FollowSportsRouteArgs> {
  FollowSportsRoute({
    _i35.Key? key,
    Function? onDone,
    String buttonText = 'Next',
    List<_i34.PageRouteInfo>? children,
  }) : super(
         FollowSportsRoute.name,
         args: FollowSportsRouteArgs(
           key: key,
           onDone: onDone,
           buttonText: buttonText,
         ),
         initialChildren: children,
       );

  static const String name = 'FollowSportsRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FollowSportsRouteArgs>(
        orElse: () => const FollowSportsRouteArgs(),
      );
      return _i15.FollowSportsPage(
        key: args.key,
        onDone: args.onDone,
        buttonText: args.buttonText,
      );
    },
  );
}

class FollowSportsRouteArgs {
  const FollowSportsRouteArgs({
    this.key,
    this.onDone,
    this.buttonText = 'Next',
  });

  final _i35.Key? key;

  final Function? onDone;

  final String buttonText;

  @override
  String toString() {
    return 'FollowSportsRouteArgs{key: $key, onDone: $onDone, buttonText: $buttonText}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! FollowSportsRouteArgs) return false;
    return key == other.key &&
        onDone == other.onDone &&
        buttonText == other.buttonText;
  }

  @override
  int get hashCode => key.hashCode ^ onDone.hashCode ^ buttonText.hashCode;
}

/// generated route for
/// [_i16.IdentityVerificationPage]
class IdentityVerificationRoute extends _i34.PageRouteInfo<void> {
  const IdentityVerificationRoute({List<_i34.PageRouteInfo>? children})
    : super(IdentityVerificationRoute.name, initialChildren: children);

  static const String name = 'IdentityVerificationRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i16.IdentityVerificationPage();
    },
  );
}

/// generated route for
/// [_i10.MessagesPage]
class MessagesRoute extends _i34.PageRouteInfo<void> {
  const MessagesRoute({List<_i34.PageRouteInfo>? children})
    : super(MessagesRoute.name, initialChildren: children);

  static const String name = 'MessagesRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i10.MessagesPage();
    },
  );
}

/// generated route for
/// [_i17.NewPasswordForm]
class NewPasswordForm extends _i34.PageRouteInfo<void> {
  const NewPasswordForm({List<_i34.PageRouteInfo>? children})
    : super(NewPasswordForm.name, initialChildren: children);

  static const String name = 'NewPasswordForm';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i17.NewPasswordForm();
    },
  );
}

/// generated route for
/// [_i18.OnboardingAddPaymentMethodPage]
class OnboardingAddPaymentMethodRoute extends _i34.PageRouteInfo<void> {
  const OnboardingAddPaymentMethodRoute({List<_i34.PageRouteInfo>? children})
    : super(OnboardingAddPaymentMethodRoute.name, initialChildren: children);

  static const String name = 'OnboardingAddPaymentMethodRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i18.OnboardingAddPaymentMethodPage();
    },
  );
}

/// generated route for
/// [_i19.PasswordResetPage]
class PasswordResetRoute extends _i34.PageRouteInfo<PasswordResetRouteArgs> {
  PasswordResetRoute({
    _i35.Key? key,
    required String emailAddress,
    List<_i34.PageRouteInfo>? children,
  }) : super(
         PasswordResetRoute.name,
         args: PasswordResetRouteArgs(key: key, emailAddress: emailAddress),
         initialChildren: children,
       );

  static const String name = 'PasswordResetRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PasswordResetRouteArgs>();
      return _i19.PasswordResetPage(
        key: args.key,
        emailAddress: args.emailAddress,
      );
    },
  );
}

class PasswordResetRouteArgs {
  const PasswordResetRouteArgs({this.key, required this.emailAddress});

  final _i35.Key? key;

  final String emailAddress;

  @override
  String toString() {
    return 'PasswordResetRouteArgs{key: $key, emailAddress: $emailAddress}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PasswordResetRouteArgs) return false;
    return key == other.key && emailAddress == other.emailAddress;
  }

  @override
  int get hashCode => key.hashCode ^ emailAddress.hashCode;
}

/// generated route for
/// [_i20.PaymentMethodsListPage]
class PaymentMethodsListRoute extends _i34.PageRouteInfo<void> {
  const PaymentMethodsListRoute({List<_i34.PageRouteInfo>? children})
    : super(PaymentMethodsListRoute.name, initialChildren: children);

  static const String name = 'PaymentMethodsListRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i20.PaymentMethodsListPage();
    },
  );
}

/// generated route for
/// [_i20.PaymentsPage]
class PaymentsRoute extends _i34.PageRouteInfo<void> {
  const PaymentsRoute({List<_i34.PageRouteInfo>? children})
    : super(PaymentsRoute.name, initialChildren: children);

  static const String name = 'PaymentsRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i20.PaymentsPage();
    },
  );
}

/// generated route for
/// [_i12.ProfilePage]
class ProfileRoute extends _i34.PageRouteInfo<void> {
  const ProfileRoute({List<_i34.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i12.ProfilePage();
    },
  );
}

/// generated route for
/// [_i21.RegistrationPage]
class RegistrationRoute extends _i34.PageRouteInfo<void> {
  const RegistrationRoute({List<_i34.PageRouteInfo>? children})
    : super(RegistrationRoute.name, initialChildren: children);

  static const String name = 'RegistrationRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i21.RegistrationPage();
    },
  );
}

/// generated route for
/// [_i22.ReportConversationCompletedPage]
class ReportConversationCompletedRoute extends _i34.PageRouteInfo<void> {
  const ReportConversationCompletedRoute({List<_i34.PageRouteInfo>? children})
    : super(ReportConversationCompletedRoute.name, initialChildren: children);

  static const String name = 'ReportConversationCompletedRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i22.ReportConversationCompletedPage();
    },
  );
}

/// generated route for
/// [_i23.ReportConversationFormPage]
class ReportConversationFormRoute extends _i34.PageRouteInfo<void> {
  const ReportConversationFormRoute({List<_i34.PageRouteInfo>? children})
    : super(ReportConversationFormRoute.name, initialChildren: children);

  static const String name = 'ReportConversationFormRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i23.ReportConversationFormPage();
    },
  );
}

/// generated route for
/// [_i24.ReportConversationPage]
class ReportConversationRoute
    extends _i34.PageRouteInfo<ReportConversationRouteArgs> {
  ReportConversationRoute({
    _i35.Key? key,
    required String conversationId,
    List<_i34.PageRouteInfo>? children,
  }) : super(
         ReportConversationRoute.name,
         args: ReportConversationRouteArgs(
           key: key,
           conversationId: conversationId,
         ),
         rawPathParams: {'conversationId': conversationId},
         initialChildren: children,
       );

  static const String name = 'ReportConversationRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<ReportConversationRouteArgs>(
        orElse: () => ReportConversationRouteArgs(
          conversationId: pathParams.getString('conversationId'),
        ),
      );
      return _i24.ReportConversationPage(
        key: args.key,
        conversationId: args.conversationId,
      );
    },
  );
}

class ReportConversationRouteArgs {
  const ReportConversationRouteArgs({this.key, required this.conversationId});

  final _i35.Key? key;

  final String conversationId;

  @override
  String toString() {
    return 'ReportConversationRouteArgs{key: $key, conversationId: $conversationId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ReportConversationRouteArgs) return false;
    return key == other.key && conversationId == other.conversationId;
  }

  @override
  int get hashCode => key.hashCode ^ conversationId.hashCode;
}

/// generated route for
/// [_i25.RequestSchoolPage]
class RequestSchoolRoute extends _i34.PageRouteInfo<void> {
  const RequestSchoolRoute({List<_i34.PageRouteInfo>? children})
    : super(RequestSchoolRoute.name, initialChildren: children);

  static const String name = 'RequestSchoolRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i25.RequestSchoolPage();
    },
  );
}

/// generated route for
/// [_i26.SchoolRequestCompletedPage]
class SchoolRequestCompletedRoute extends _i34.PageRouteInfo<void> {
  const SchoolRequestCompletedRoute({List<_i34.PageRouteInfo>? children})
    : super(SchoolRequestCompletedRoute.name, initialChildren: children);

  static const String name = 'SchoolRequestCompletedRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i26.SchoolRequestCompletedPage();
    },
  );
}

/// generated route for
/// [_i27.SchoolRequestFormPage]
class SchoolRequestFormRoute extends _i34.PageRouteInfo<void> {
  const SchoolRequestFormRoute({List<_i34.PageRouteInfo>? children})
    : super(SchoolRequestFormRoute.name, initialChildren: children);

  static const String name = 'SchoolRequestFormRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i27.SchoolRequestFormPage();
    },
  );
}

/// generated route for
/// [_i28.SplashScreen]
class SplashRoute extends _i34.PageRouteInfo<void> {
  const SplashRoute({List<_i34.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i28.SplashScreen();
    },
  );
}

/// generated route for
/// [_i29.TeamProfilePage]
class TeamProfileRoute extends _i34.PageRouteInfo<TeamProfileRouteArgs> {
  TeamProfileRoute({
    required String schoolId,
    _i35.Key? key,
    List<_i34.PageRouteInfo>? children,
  }) : super(
         TeamProfileRoute.name,
         args: TeamProfileRouteArgs(schoolId: schoolId, key: key),
         rawPathParams: {'schoolId': schoolId},
         initialChildren: children,
       );

  static const String name = 'TeamProfileRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<TeamProfileRouteArgs>(
        orElse: () =>
            TeamProfileRouteArgs(schoolId: pathParams.getString('schoolId')),
      );
      return _i29.TeamProfilePage(schoolId: args.schoolId, key: args.key);
    },
  );
}

class TeamProfileRouteArgs {
  const TeamProfileRouteArgs({required this.schoolId, this.key});

  final String schoolId;

  final _i35.Key? key;

  @override
  String toString() {
    return 'TeamProfileRouteArgs{schoolId: $schoolId, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TeamProfileRouteArgs) return false;
    return schoolId == other.schoolId && key == other.key;
  }

  @override
  int get hashCode => schoolId.hashCode ^ key.hashCode;
}

/// generated route for
/// [_i30.TeamSearchPage]
class TeamSearchRoute extends _i34.PageRouteInfo<void> {
  const TeamSearchRoute({List<_i34.PageRouteInfo>? children})
    : super(TeamSearchRoute.name, initialChildren: children);

  static const String name = 'TeamSearchRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i30.TeamSearchPage();
    },
  );
}

/// generated route for
/// [_i31.UpdateEmailPage]
class UpdateEmailRoute extends _i34.PageRouteInfo<void> {
  const UpdateEmailRoute({List<_i34.PageRouteInfo>? children})
    : super(UpdateEmailRoute.name, initialChildren: children);

  static const String name = 'UpdateEmailRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i31.UpdateEmailPage();
    },
  );
}

/// generated route for
/// [_i32.UpdatePhonePage]
class UpdatePhoneRoute extends _i34.PageRouteInfo<void> {
  const UpdatePhoneRoute({List<_i34.PageRouteInfo>? children})
    : super(UpdatePhoneRoute.name, initialChildren: children);

  static const String name = 'UpdatePhoneRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i32.UpdatePhonePage();
    },
  );
}

/// generated route for
/// [_i33.UserOnboardingPage]
class UserOnboardingRoute extends _i34.PageRouteInfo<void> {
  const UserOnboardingRoute({List<_i34.PageRouteInfo>? children})
    : super(UserOnboardingRoute.name, initialChildren: children);

  static const String name = 'UserOnboardingRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i33.UserOnboardingPage();
    },
  );
}
