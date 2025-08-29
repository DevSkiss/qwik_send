import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_send/core/router/app_router.dart';
import 'package:quick_send/features/home/presentation/bloc/home_bloc.dart';
import 'package:quick_send/features/home/presentation/bloc/home_state.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => HomeBloc(), child: HomeView());
  }
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeBloc bloc;

  @override
  void initState() {
    bloc = context.read<HomeBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Home Screen'),
              ElevatedButton(
                onPressed: () {
                  bloc.logout().then((_) {
                    context.router.replaceAll([AuthRoute()]);
                  });
                },
                child: Text('Logout'),
              ),
            ],
          ),
        );
      },
    );
  }
}
