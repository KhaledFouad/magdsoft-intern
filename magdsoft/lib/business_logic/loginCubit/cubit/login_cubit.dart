import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magdsoft/constants/end_points.dart';
import 'package:magdsoft/data/data_providers/remote/dio_helper.dart';
import 'package:magdsoft/data/models/LoginModel.dart';
import 'package:magdsoft/presentation/styles/colors.dart';
import 'package:meta/meta.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  LoginModel loginModel = LoginModel();
  String otp = "";
  login(String name, String phone) {
    emit(loadingState());
    DioHelper.postData(
        endPoint: EndPoints.login,
        data: {'name': name, 'phone': phone}).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      otp = loginModel.code.toString();
      print(loginModel.message);
      print(loginModel.code);
      if (loginModel.message.toString() ==
          "phone number must be more than 10 and less than 15") {
        Fluttertoast.showToast(
            msg: "phone number must be more than 10 and less than 15",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: AppColor.blue,
            textColor: AppColor.white,
            fontSize: 16.0);
        emit(loginFailed());
      } else if (loginModel.message.toString() == "name is Required") {
        Fluttertoast.showToast(
            msg: "name is Required",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: AppColor.blue,
            textColor: AppColor.white,
            fontSize: 16.0);
        emit(loginFailed());
      } else if (loginModel.message.toString() == "phone is Required") {
        Fluttertoast.showToast(
            msg: "phone is Required",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: AppColor.blue,
            textColor: AppColor.white,
            fontSize: 16.0);
        emit(loginFailed());
      } else if (loginModel.message.toString() ==
          "phone number must be more than 10 and less than 15") {
        Fluttertoast.showToast(
            msg: "phone number must be more than 10 and less than 15",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: AppColor.blue,
            textColor: AppColor.white,
            fontSize: 16.0);
        emit(loginFailed());
      }
      if (loginModel.status == 200 ||
          loginModel.message.toString() == "Account Created Successfully") {
        Fluttertoast.showToast(
            msg: "Account Created Successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: AppColor.blue,
            textColor: AppColor.white,
            fontSize: 16.0);
        emit(loginSuccess());
      }
    }).catchError((e) {
      print(e.toString());
      Fluttertoast.showToast(
          msg: "login failed",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: AppColor.blue,
          textColor: AppColor.white,
          fontSize: 16.0);
      emit(loginFailed());
    });
  }
}
