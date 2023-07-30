import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/config/app_padding.dart';
import 'package:kost/config/app_space.dart';
import 'package:kost/config/app_text_style.dart';
import 'package:kost/config/responsive.dart';
import 'package:kost/domain/model/category/category.dart';
import 'package:kost/domain/model/cost/cost.dart';
import 'package:kost/presentation/cost_table/widget/quantity_text_field.dart';
import 'package:kost/presentation/cost_table/widget/unit_prices_alert_dialog.dart';

import '../../../domain/bloc/cost_table_bloc.dart';
import '../../../domain/bloc/cost_table_event.dart';
import '../../../domain/model/unit_price/unit_price.dart';

class CostItem extends StatelessWidget {
  const CostItem({Key? key, required this.cost, required this.index, required this.unitPrices})
      : super(key: key);

  final Cost cost;
  final int index;
  final List<UnitPrice> unitPrices;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: index.isOdd ? Colors.grey.shade400 : Colors.grey.shade200,
      height: Responsive.value(context, 120 , 80, 80),
      padding: AppPadding.hM!,
      child: Column(
        children: [
          if(Responsive.isMobile(context))
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text(cost.category.jobCategory.nameTr, style: AppTextStyle.b3b,)),
                  IconButton(
                      onPressed: () {
                        context.read<CostTableBloc>().add(DeleteCostCategory(cost.category));
                      },
                      icon: const Icon(Icons.delete)
                  ),
                ],
              ),
            ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                if(!Responsive.isMobile(context))
                  Expanded(flex: 2, child: Text(cost.category.jobCategory.nameTr, style: AppTextStyle.responsiveB1(context),)),
                Expanded(
                    child: TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (dialogContext) {
                              return UnitPricesAlertDialog(
                                unitPrices: unitPrices,
                                onUnitPriceSelect: (index) {
                                  context.read<CostTableBloc>().add(ReplaceUnitPrice(cost.category, unitPrices[index].category));
                                  Navigator.of(context).pop();
                                },
                              );
                            },
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(cost.unitPriceNameText, style: AppTextStyle.responsiveB1(context), textAlign: TextAlign.center,),
                            Icon(Icons.change_circle)
                          ],
                        )
                    )
                ),
                Expanded(child: Text(cost.unitPriceAmountText, style: AppTextStyle.responsiveB1(context),),),
                Expanded(
                    child: Row(
                      children: [
                        if(Responsive.isDesktop(context))
                          Row(
                            children: [
                              Tooltip(
                                message: cost.quantityExplanationText,
                                child: const Icon(Icons.info_outlined),
                              ),
                              AppSpace.hM!,
                            ],
                          ),
                        Expanded(
                          flex: Responsive.value(context, 8, 4, 1),
                          child: QuantityTextField(
                            formattedQuantity: cost.quantityText,
                            symbol: cost.quantityUnitText,
                            onFieldSubmitted: (value) {
                              context.read<CostTableBloc>().add(
                                ChangeQuantityManually(cost.category.jobCategory, value)
                              );
                            },
                          ),
                        ),
                        AppSpace.hExpanded!,
                      ],
                    )),
                if(!Responsive.isMobile(context))
                Expanded(
                  child: Row(
                    children: [
                      Text(cost.formattedTotalPriceTRY, style: AppTextStyle.responsiveB1(context),),
                    ],
                  )),
                if(!Responsive.isMobile(context))
                  IconButton(
                    onPressed: () {
                      context
                          .read<CostTableBloc>()
                          .add(DeleteCostCategory(cost.category));
                    },
                    icon: const Icon(Icons.delete)
                  )
              ],
            ),
          ),
          if(Responsive.isMobile(context))
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(cost.formattedTotalPriceTRY, style: AppTextStyle.b3b,)
              )
            ),
        ],
      ),
    );
  }
}
