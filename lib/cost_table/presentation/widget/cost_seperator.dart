import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/common/model/job.dart';

import '../../../common/config/app_padding.dart';
import '../../../common/config/app_text_style.dart';
import '../../../common/config/responsive.dart';
import '../../domain/bloc/cost_table_bloc.dart';
import '../../domain/bloc/cost_table_event.dart';
import 'main_category_title.dart';

class CostSeparator extends StatelessWidget {
  const CostSeparator({Key? key, required this.mainCategory, required this.formattedSubTotalsTRY}) : super(key: key);

  final MainCategory mainCategory;
  final Map<MainCategory, String> formattedSubTotalsTRY;

  @override
  Widget build(BuildContext context) {
    final visible = context.read<CostTableBloc>().state.categoryVisibilities[mainCategory] ?? true;
    return InkWell(
      onTap: () => context.read<CostTableBloc>().add(ExpandCollapseMainCategory(mainCategory)),
      child: Container(
        height: 80,
        padding: Responsive.value(context, AppPadding.hS , AppPadding.hM, AppPadding.hM),
        decoration: BoxDecoration(
            border: visible ? null : Border.all()
        ),
        child: Row(
          children: [
            Expanded(
                flex: 4, child: MainCategoryTitle(text: mainCategory.nameTr)),
            Expanded(
              flex: Responsive.value(context, 2, 1, 1),
              child: Text(formattedSubTotalsTRY[mainCategory] ?? "", style: AppTextStyle.responsiveH5B(context),),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Icon(visible ? Icons.arrow_drop_down : Icons.arrow_right, size: 24,),
            )
          ],
        ),
      ),
    );
  }
}
