import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_send/core/router/app_router.dart';
import 'package:quick_send/features/home/presentation/bloc/home_bloc.dart';
import 'package:quick_send/features/home/presentation/bloc/home_state.dart';
import 'package:quick_send/features/layout/presentation/bloc/layout_bloc.dart';

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
          body: Container(
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Balance:',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(width: 8),
                    InkWell(
                      child: Tooltip(
                        message: state.hideAmount
                            ? 'Show Balance'
                            : 'Hide Balance',
                        child: Icon(
                          state.hideAmount
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.teal[700],
                        ),
                      ),
                      onTap: () => bloc.toggleHideAmount(),
                    ),
                  ],
                ),
                Text(
                  state.hideAmount ? '\n****.00 PHP' : '\n1,232,734.00 PHP',
                  key: const ValueKey('shown'),
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.teal[700],
                  ),
                ),
                const SizedBox(width: 8),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<LayoutBloc>().updateCurrentIndex(1);
                          context.router.navigate(SendMoneyRoute());
                        },
                        child: Text('Send Money'),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<LayoutBloc>().updateCurrentIndex(2);
                          context.router.navigate(TransactionRoute());
                        },
                        child: Text('View Transactions'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
