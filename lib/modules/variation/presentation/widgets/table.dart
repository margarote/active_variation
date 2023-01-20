import 'package:flutter/material.dart';

import '../../../../core/theme/colors_app.dart';
import '../../../../core/theme/text_theme_app.dart';
import '../../../../core/widgets/text_widget.dart';
import '../../domain/entities/calculated_variation_entity.dart';

class TableWidget extends StatefulWidget {
  final List<CalculatedVariationEntity> variationCalculeted;
  const TableWidget({super.key, required this.variationCalculeted});

  @override
  State<TableWidget> createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsApp.background,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(
              label: TextWidget(
                text: "Dia",
                textStyleNum: TextStyleNum.headline1,
              ),
            ),
            DataColumn(
              label: TextWidget(
                text: "Data",
                textStyleNum: TextStyleNum.headline1,
              ),
            ),
            DataColumn(
              label: TextWidget(
                text: "Valor",
                textStyleNum: TextStyleNum.headline1,
              ),
            ),
            DataColumn(
              label: TextWidget(
                text: "Variação em relaçào a D-1",
                textStyleNum: TextStyleNum.headline1,
              ),
            ),
            DataColumn(
              label: TextWidget(
                text: "VR em relação a primeira data",
                textStyleNum: TextStyleNum.headline1,
              ),
            ),
          ],
          rows: widget.variationCalculeted
              .map((e) => DataRow(
                    cells: [
                      DataCell(
                        TextWidget(
                          text: e.day.toString(),
                          textStyleNum: TextStyleNum.headline1,
                        ),
                      ),
                      DataCell(
                        TextWidget(
                          text: e.date.toString(),
                          textStyleNum: TextStyleNum.headline1,
                        ),
                      ),
                      DataCell(
                        TextWidget(
                          text: e.value.toString(),
                          textStyleNum: TextStyleNum.headline1,
                        ),
                      ),
                      DataCell(
                        TextWidget(
                          text: e.variationD1.toString(),
                          textStyleNum: TextStyleNum.headline1,
                        ),
                      ),
                      DataCell(
                        TextWidget(
                          text: e.variationPrimaryDate.toString(),
                          textStyleNum: TextStyleNum.headline1,
                        ),
                      ),
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }
}
