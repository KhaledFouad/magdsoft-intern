import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft/constants/end_points.dart';
import 'package:magdsoft/data/data_providers/remote/dio_helper.dart';
import 'package:magdsoft/data/models/HelpModel.dart';
import 'package:meta/meta.dart';

part 'help_cubit_state.dart';

class HelpCubitCubit extends Cubit<HelpCubitState> {
  HelpCubitCubit() : super(HelpCubitInitial());
  static HelpCubitCubit get(context) => BlocProvider.of(context);
  HelpCubitCubit loginModel = HelpCubitCubit();
  List<HelpModel> _help = [];

  Future<List<HelpModel>> getHelp() async {
    var response = await DioHelper.getData(endPoint: EndPoints.help);
    var helpData = response.data["help"];
    return helpData.map((help) => HelpModel.fromJson(help)).toList();
  }

  List<HelpModel> help() {
    getHelp().then((value) {
      emit(HelpLoaded(value));
      _help = value;
    });

    return _help;
  }
}
