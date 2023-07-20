part of 'help_cubit_cubit.dart';

@immutable
abstract class HelpCubitState {}

class HelpCubitInitial extends HelpCubitState {}
class HelpLoaded extends HelpCubitState {
  final List<HelpModel> help;

  HelpLoaded(this.help);
}

