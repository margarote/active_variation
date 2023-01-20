import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/inject/inject_container.dart';
import '../../../../core/theme/colors_app.dart';
import '../../../../core/theme/text_theme_app.dart';
import '../../../../core/widgets/button_widget.dart';
import '../../../../core/widgets/text_widget.dart';
import '../../domain/usecases/calculated_variation.dart';
import '../controllers/search_symbol_controller.dart';
import '../state/search_symbol_state.dart';
import '../widgets/chart.dart';
import '../widgets/table.dart';

class VariationScreen extends StatefulWidget {
  const VariationScreen({super.key});

  @override
  State<VariationScreen> createState() => _VariationScreenState();
}

class _VariationScreenState extends State<VariationScreen> {
  late final SearchSymbolController _searchSymbolController;
  late final String symbol;
  late final ValueNotifier<bool> showGraph;
  late final CalculatedVariation calculatedVariation;
  late final MethodChannel methodChannelMessage;
  late final MethodChannel methodChannelScreens;

  @override
  void initState() {
    _searchSymbolController = sl<SearchSymbolController>();
    calculatedVariation = CalculatedVariation();
    symbol = "PETR4.SA";
    showGraph = ValueNotifier(false);
    methodChannelMessage = const MethodChannel("messages");
    methodChannelScreens = const MethodChannel("screens");

    _searchSymbolController.call(symbol);
    methodChannelMessage.setMethodCallHandler((call) async {
      if (call.method == "message") {
        showGraph.value = call.arguments;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.background,
      body: SafeArea(
        child: ValueListenableBuilder<SearchSymbolState>(
          valueListenable: _searchSymbolController,
          builder: (context, state, child) {
            switch (state.runtimeType) {
              case InitialSearchSymbolState:
              case LoadingSearchSymbolState:
                return _loading();
              case ErrorSearchSymbolState:
                final message = (state as ErrorSearchSymbolState).message;
                return _error(message);
              case SuccessSearchSymbolState:
                final data = (state as SuccessSearchSymbolState).chart;
                final calculatedVariationEntity = calculatedVariation.call(data!);
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (Platform.isAndroid)
                        const SizedBox(
                          height: 60,
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 24, bottom: 10),
                            child: TextWidget(
                              textStyleNum: TextStyleNum.titleLarge,
                              text: symbol,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16, bottom: 10),
                            child: ButtonWidget(
                              width: 80,
                              height: 30,
                              textStyleNum: TextStyleNum.headline1,
                              onTap: () async {
                                await methodChannelScreens.invokeMethod("open_dialog");
                              },
                              text: "Alterar",
                              secoundaryButton: false,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ValueListenableBuilder<bool>(
                          valueListenable: showGraph,
                          builder: (context, state, child) {
                            return Visibility(
                              visible: state,
                              replacement: TableWidget(
                                variationCalculeted: calculatedVariationEntity,
                              ),
                              child: LineChartSample9(
                                chart: data,
                                variationCalculeted: calculatedVariationEntity,
                              ),
                            );
                          }),
                    ],
                  ),
                );
              default:
                return Container();
            }
          },
        ),
      ),
    );
  }

  Widget _error(String message) {
    return Center(
      child: TextWidget(
        textStyleNum: TextStyleNum.headline3,
        text: message,
        fontWeightNum: FontWeightNum.w400,
        headlineColor: ColorsApp.secoundaryTextColor,
      ),
    );
  }

  Widget _loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
