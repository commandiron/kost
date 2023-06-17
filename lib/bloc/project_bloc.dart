import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/logic/cost_item/cost_item.dart';

import 'project_event.dart';
import 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc() : super(
    ProjectState(
      excavationCostItems: List.empty(),
    )
  ) {
    on<Init>((event, emit) {
      add(const CreateExcavationCostItems());
    });
    on<CreateExcavationCostItems>((event, emit) {
      emit(
        state.copyWith(
          excavationCostItems: [
            Shoring(
              quantity: calculateShoringQuantity()
            ),
            Excavation(),
            Breaker()
          ]
        )
      );
    });
  }
  void init() {
    add(const Init());
  }

  double calculateShoringQuantity() {
    return 0;
  }

  double calculateExcavationQuantity() {
    return 0;
  }
}
