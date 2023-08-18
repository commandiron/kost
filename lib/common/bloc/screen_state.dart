abstract class BlocState {}

class Initial extends BlocState {}

class Loading extends BlocState {}

class Error extends BlocState {
  final String message;
  Error({required this.message});
}

class Completed extends BlocState {
  final dynamic data;
  Completed({this.data});
}
