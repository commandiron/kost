abstract class ScreenState {}

class InitialScreenState extends ScreenState {}

class LoadingScreenState extends ScreenState {}

class CompletedScreenState extends ScreenState {
  final dynamic data;
  CompletedScreenState({this.data});
}
