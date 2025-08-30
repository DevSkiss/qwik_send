import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_send/core/router/app_router.dart';
import 'package:quick_send/features/layout/presentation/bloc/layout_bloc.dart';
import 'package:quick_send/features/layout/presentation/bloc/layout_state.dart';

@RoutePage()
class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => LayoutBloc(), child: LayoutView());
  }
}

class LayoutView extends StatefulWidget {
  const LayoutView({Key? key}) : super(key: key);

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  late LayoutBloc bloc;
  int currentIndex = 0;
  @override
  void initState() {
    bloc = context.read<LayoutBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutBloc, LayoutState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Qwik Send'),
            actions: [
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
          body: AutoRouter(),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.currentIndex,
            onTap: (val) {
              if (val == 0) {
                context.router.navigate(HomeRoute());
              } else if (val == 1) {
                context.router.navigate(SendMoneyRoute());
              } else {
                context.router.navigate(TransactionRoute());
              }
              bloc.updateCurrentIndex(val);
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.send), label: 'Send'),
              BottomNavigationBarItem(
                icon: Icon(Icons.send),
                label: 'Transactions',
              ),
            ],
          ),
        );
      },
    );
  }
}
