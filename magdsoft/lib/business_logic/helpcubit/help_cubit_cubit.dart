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

  help() {
    DioHelper.getData(endPoint: EndPoints.help).then((value) {
      HelpModel.fromJson(value.data);
    });
  }
}
