abstract class ScreenState {}

class InitialScreenState extends ScreenState {}

class LoadingScreenState extends ScreenState {}

class ErrorScreenState extends ScreenState {
  final String message;
  ErrorScreenState({required this.message});
}

class CompletedScreenState extends ScreenState {
  final dynamic data;
  CompletedScreenState({this.data});
}
