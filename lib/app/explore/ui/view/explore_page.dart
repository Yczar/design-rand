import 'package:design_task/app/explore/ui/cubit/explore_cubit.dart';
import 'package:design_task/app/explore/ui/widgets/transaction_section.dart';
import 'package:design_task/app/transactions/ui/cubit/transactions_cubit.dart';
import 'package:design_task/core/models/asset.dart';
import 'package:design_task/core/utiils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ExploreCubit(),
      child: const ExploreView(),
    );
  }
}

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  late List<Asset> _assets;
  @override
  void initState() {
    super.initState();
    _assets = generateRandomAssets();
    context.read<TransactionsCubit>().getTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: const Text(
          'Explore',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Text(
                    'My Balance',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const Text(
                '₦5,000.00',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'My Assets',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'See all',
                    ),
                  ),
                ],
              ),
              Column(
                children: List.generate(
                  _assets.length,
                  (index) {
                    final asset = _assets[index];
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        radius: 24,
                        child: Text(
                          asset.symbol.substring(
                            0,
                            1,
                          ),
                        ), // Display the first letter of the symbol
                      ),
                      title: Text(asset.name),
                      subtitle: Text(asset.symbol),
                      trailing: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize
                            .min, // Add this line to prevent vertical size issues
                        children: [
                          Text(
                            asset.price,
                            style: const TextStyle(
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            asset.percentageChange,
                            style: TextStyle(
                              color: asset.changeColor,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const TransactionsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
