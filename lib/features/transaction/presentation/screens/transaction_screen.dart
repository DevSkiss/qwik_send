import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:quick_send/features/transaction/presentation/bloc/transaction_bloc.dart';
import 'package:quick_send/features/transaction/presentation/bloc/transaction_state.dart';

@RoutePage()
class TransactionScreen extends StatelessWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransactionBloc(),
      child: const TransactionView(),
    );
  }
}

class TransactionView extends StatefulWidget {
  const TransactionView({Key? key}) : super(key: key);

  @override
  State<TransactionView> createState() => _TransactionViewState();
}

class _TransactionViewState extends State<TransactionView> {
  final format = DateFormat('yyyy-MM-dd');
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransactionBloc, TransactionState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Container(
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: 32),
                Row(
                  children: [
                    Text(
                      'Transactions',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<TransactionBloc>().getTransactions();
                      },
                      icon: Icon(Icons.refresh),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: state.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : (state.transactions == null ||
                            state.transactions!.isEmpty)
                      ? const Center(child: Text('No transactions found'))
                      : ListView.separated(
                          itemCount: state.transactions!.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            final txn = state.transactions![index];
                            return Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: ListTile(
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        txn.amount != null
                                            ? '₱${txn.amount!.toStringAsFixed(2)}'
                                            : '',
                                        style: TextStyle(
                                          color:
                                              txn.amount != null &&
                                                  txn.amount! < 0
                                              ? Colors.red
                                              : Colors.green,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),

                                    Text(
                                      format.format(
                                        DateTime.parse(txn.date ?? ''),
                                      ),
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
