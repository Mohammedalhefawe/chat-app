//
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
//
// import '../../data/models/login_request_body.dart';
// import '../../data/repos/login_repo.dart';
// import 'login_state.dart';
//
// class LoginCubit extends Cubit<LoginState> {
//   final LoginRepo _loginRepo;
//   LoginCubit(this._loginRepo) : super(const LoginState.initial());
//
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   final formKey = GlobalKey<FormState>();
//
//   void emitLoginStates() async {
//     emit(const LoginState.loading());
//     final response = await _loginRepo.login(
//       LoginRequestBody(
//         email: emailController.text,
//         password: passwordController.text,
//       ),
//     );
//     response.when(success: (loginResponse) {
//       emit(LoginState.success(loginResponse));
//     }, failure: (error) {
//       emit(LoginState.error(error: error.apiErrorModel.message ?? 'Credentials doesn\'t match our records'));
//     });
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/sharedpreference.dart';
import '../../../../networking/dio_factory.dart';
import '../../data/models/login_request_body.dart';
import '../../data/repos/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {

  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),

    );


    response.when(success: (loginResponse)async {
      await saveUserToken(loginResponse.userData?.access_token ?? '');
      emit(LoginState.success(loginResponse));
    }, failure: (error) {
      emit(LoginState.error(error: error.apiErrorModel.message ?? 'Credentials doesn\'t match our records'));
    });
  }
  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setData(SharedPrefKeys.userToken, token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }
}