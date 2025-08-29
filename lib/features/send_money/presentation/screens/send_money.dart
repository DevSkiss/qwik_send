import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_send/features/send_money/presentation/bloc/send_money_bloc.dart';
import 'package:quick_send/features/send_money/presentation/bloc/send_money_state.dart';

@RoutePage()
class SendMoneyScreen extends StatelessWidget {
  const SendMoneyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SendMoneyBloc(),
      child: const SendMoneyView(),
    );
  }
}

class SendMoneyView extends StatefulWidget {
  const SendMoneyView({Key? key}) : super(key: key);

  @override
  State<SendMoneyView> createState() => _SendMoneyViewState();
}

class _SendMoneyViewState extends State<SendMoneyView> {
  final TextEditingController _amountController = TextEditingController();
  late SendMoneyBloc bloc;

  @override
  void initState() {
    bloc = context.read<SendMoneyBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SendMoneyBloc, SendMoneyState>(
      listener: (context, state) {
        if (state.successText != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.successText ?? '---')));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: 32),
                TextFormField(
                  controller: _amountController,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    labelText: 'Sending Money',

                    border: OutlineInputBorder(),
                  ),
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          bloc.sendMoney(_amountController.text).then((value) {
                            _amountController.clear();
                          });
                        },
                        child: Text('Send Money'),
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
