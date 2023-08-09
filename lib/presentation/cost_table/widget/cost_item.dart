import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/config/app_padding.dart';
import 'package:kost/config/app_space.dart';
import 'package:kost/config/app_text_style.dart';
import 'package:kost/config/responsive.dart';
import 'package:kost/domain/model/cost/cost.dart';
import 'package:kost/presentation/cost_table/widget/quantity_text_field.dart';
import 'package:kost/presentation/cost_table/widget/unit_prices_alert_dialog.dart';

import '../../../domain/bloc/cost_table_bloc.dart';
import '../../../domain/bloc/cost_table_event.dart';
import 'delete_button.dart';

class CostItem extends StatelessWidget {
  const CostItem({Key? key, required this.cost, required this.index})
      : super(key: key);

  final Cost cost;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: index.isOdd ? Colors.grey.shade400 : Colors.grey.shade200,
      height: Responsive.value(context, 136.0 , 80.0, 80.0),
      padding: Responsive.value(context, AppPadding.hS , AppPadding.hM, AppPadding.hM),
      child: Column(
        children: [
          if(Responsive.isMobile(context))
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text(cost.jobName, style: AppTextStyle.b3b,)),
                  DeleteButton(name: cost.jobName, jobId: cost.jobId,)
                ],
              ),
            ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                if(!Responsive.isMobile(context))
                  Expanded(child: Text(cost.jobName, style: AppTextStyle.responsiveB1(context),)),
                Expanded(
                  child: cost.enabledUnitPrices.length > 1
                    ? TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (dialogContext) {
                              return UnitPricesAlertDialog(
                                unitPrices: cost.enabledUnitPrices,
                                onUnitPriceSelect: (index) {
                                  context.read<CostTableBloc>().add(ReplaceUnitPrice(cost.jobId, cost.enabledUnitPrices[index].category));
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
                            const Icon(Icons.change_circle)
                          ],
                        )
                      )
                    : Text(cost.unitPriceNameText, style: AppTextStyle.responsiveH5(context), textAlign: TextAlign.center,),
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
                                ChangeQuantityManually(cost.jobId, value)
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
                  DeleteButton(name: cost.jobName, jobId: cost.jobId,)
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