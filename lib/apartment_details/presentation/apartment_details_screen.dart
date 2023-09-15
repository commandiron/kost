import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/apartment_details/domain/bloc/apartment_details_event.dart';
import 'package:kost/apartment_details/presentation/apartment_details_listener.dart';
import 'package:kost/apartment_details/presentation/views/floor_viewer_view.dart';

import '../domain/bloc/apartment_details_bloc.dart';

class ApartmentDetailsScreen extends StatelessWidget {
  const ApartmentDetailsScreen({Key? key}) : super(key: key);

  static const route = "apartment_details";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ApartmentDetailsBloc()..add(const InitApartmentDetailsBloc()),
      child: const ApartmentDetailsListener(
        child: FloorViewerView()
      ),
    );
  }
}