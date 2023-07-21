import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft/constants/end_points.dart';
import 'package:magdsoft/data/data_providers/remote/dio_helper.dart';
import 'package:magdsoft/data/models/HelpModel.dart';
import 'package:meta/meta.dart';

part 'help_cubit_state.dart';

class HelpCubitCubit extends Cubit<HelpCubitState> {
  HelpCubitCubit() : super(HelpCubitInitial());
  static HelpCubitCubit get(context) => BlocProvider.of(context);
  // HelpCubitCubit loginModel = HelpCubitCubit();
  // List<HelpModel> _help = [];

  // Future<List<HelpModel>> getHelp() async {
  //   var response = await DioHelper.getData(endPoint: EndPoints.help);
  //   var helpData = response.data["help"];
  //   return helpData.map((help) => HelpModel.fromJson(help)).toList();
  // }

  // List<HelpModel> help() {
  //   getHelp().then((value) {
  //     emit(HelpLoaded(value));
  //     _help = value;
  //   });

  //   return _help;
  // }

  Future<Map<String, dynamic>> fetchDataFromAPI() async {
// Replace with the specific API endpoint for fetching help data

  try {
    Response response = await DioHelper.getData(endPoint: EndPoints.help);
    if (response.statusCode == 200) {
      // If the request is successful, parse the response data
      Map<String, dynamic> jsonData = response.data;
      return jsonData;
    } else {
      // If the request is not successful, throw an error
      throw Exception('Failed to load data from API');
    }
  } catch (e) {
    // Catch any errors that occur during the API request
    print('Error: $e');
    throw Exception('Failed to load data from API');
  }
}
}
