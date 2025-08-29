import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_send/core/router/app_router.dart';
import 'package:quick_send/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:quick_send/features/auth/presentation/bloc/auth_state.dart';
import 'package:quick_send/shared/constants/app_colors.dart';

@RoutePage()
class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: const AuthView(),
    );
  }
}

class AuthView extends StatefulWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  late AuthBloc bloc;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    bloc = context.read<AuthBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.hasSession) {
          context.router.replaceAll([LayoutRoute()]);
        }

        if (state.errorText != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.errorText!,
                style: TextStyle(color: Colors.red),
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome to Qwik Send',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 32),
                  InkWell(child: Text(state.showSignup ? 'SIGN UP' : 'LOGIN')),
                  TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!value.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }

                      if (state.showSignup) {
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffix: InkWell(
                        child: Icon(
                          state.hidePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColors.primary,
                        ),
                        onTap: () {
                          bloc.togglePasswordVisibility();
                        },
                      ),
                    ),
                    obscureText: state.hidePassword,
                  ),
                  if (state.showSignup) ...[
                    TextFormField(
                      controller: confirmPasswordController,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        suffix: InkWell(
                          child: Icon(
                            state.hideConfirmPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: AppColors.primary,
                          ),
                          onTap: () {
                            bloc.toggleConfirmPasswordVisibility();
                          },
                        ),
                      ),
                      obscureText: state.hideConfirmPassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        } else if (value != passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                  ],
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      bool validated =
                          formKey.currentState?.validate() ?? false;
                      if (validated) {
                        if (state.showSignup) {
                          bloc.signup(
                            email: usernameController.text,
                            password: passwordController.text,
                          );
                        } else {
                          bloc.login(
                            email: usernameController.text,
                            password: passwordController.text,
                          );
                        }
                      }
                    },
                    child: Text(state.showSignup ? 'Create Account' : 'LOGIN'),
                  ),
                  SizedBox(height: 32),
                  Column(
                    children: [
                      if (!state.showSignup) ...[
                        SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: () {
                            bloc.onShowSignup(true);
                          },
                          child: Text('SIGN UP'),
                        ),
                      ] else ...[
                        ElevatedButton(
                          onPressed: () {
                            bloc.onShowSignup(false);
                          },
                          child: Text('Already have an account?'),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
