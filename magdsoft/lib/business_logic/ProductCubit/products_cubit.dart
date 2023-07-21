import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/end_points.dart';
import '../../data/data_providers/remote/dio_helper.dart';
part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());
  static ProductsCubit get(context) => BlocProvider.of(context);

  Future<Map<String, dynamic>> fetchDataFromAPI() async {

    try {
      Response response =
          await DioHelper.getData(endPoint: EndPoints.getProducts);
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
      throw Exception('Failed to load data from API');
    }
  }
}
