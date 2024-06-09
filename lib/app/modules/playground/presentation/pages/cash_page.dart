import 'package:flutter/material.dart';
import 'package:nuntium_rigid/app/modules/playground/data/model/cash_request_model.dart';
import 'package:nuntium_rigid/app/modules/playground/presentation/controllers/get_cash_request_controller.dart';
import 'package:nuntium_rigid/app/shared/shared.dart';
import 'package:nuntium_rigid/core/core.dart';
import 'package:nuntium_rigid/injectable.dart';

// SEARCHING - CREATED
// CONNECTIG - PENDING (awaiting provider to accept)
// ROUTING - IN-PROGRESS (meet yourselves and update location)

class CashPage extends StatefulWidget {
  const CashPage({super.key});

  @override
  State<CashPage> createState() => _CashPageState();
}

class _CashPageState extends State<CashPage> with AppThemeMixin {
  late final GetCashRequestController cashRequestController;

  @override
  void initState() {
    cashRequestController = getIt<GetCashRequestController>();
    cashRequestController.getRequest(id: "35");

    cashRequestController.listenWhen(
      success: (data) {
        switch (data.event) {
          case "provider.found":
            context.showSuccess("Provider found");
          case "no.provider.found":
            context.showError("No provider found");
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    cashRequestController.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 200,
              child: BaseText("MAP COMPONENT HERE"),
            ),
            const SizedBox(height: 20),
            cashRequestController.buildWhen(
              loading: () {
                return const CircularProgressIndicator();
              },
              success: (data) {
                switch (data.event) {
                  case "provider.found":
                    return const ProviderFoundComponent();
                  case "no.provider.found":
                    return const NoProviderFoundComponent();
                  default:
                    return const SearchingProviderComponent();
                }
              },
              failure: (e) {
                return BaseText(
                  "$e",
                  fontSize: 30,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildEventComponents(CashRequestModel data) {
  switch (data.event) {
    case "provider.found":
      return const ProviderFoundComponent();
    case "no.provider.found":
      return const NoProviderFoundComponent();
    default:
      return const SearchingProviderComponent();
  }
}

class SearchingProviderComponent extends StatelessWidget {
  const SearchingProviderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BaseText(
            "Searching for cash provider",
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
          SizedBox(height: 20),
          BaseText(
            "Cashir is searching for nearby agents to provide cash for you",
            fontSize: 14,
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}

class ProviderFoundComponent extends StatelessWidget {
  const ProviderFoundComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BaseText(
            "Provider found",
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
          SizedBox(height: 20),
          BaseText(
            "Waiting for provider to accept your request",
            fontSize: 14,
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}

class RouteToProviderComponent extends StatelessWidget {
  const RouteToProviderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class NoProviderFoundComponent extends StatelessWidget {
  const NoProviderFoundComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.error,
            color: Colors.orange,
            size: 30,
          ),
          SizedBox(height: 10),
          BaseText(
            "No Provider found",
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
          SizedBox(height: 20),
          BaseText(
            "No provider found now",
            fontSize: 14,
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
