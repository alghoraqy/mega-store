import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_store/bloc/Login/login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitState());

  static LoginCubit get(context) => BlocProvider.of(context);

  var formKey = GlobalKey<FormState>();

  /// CONTROLLERS
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //ForgetPassController
  TextEditingController forgetpasswordController = TextEditingController();
  var formKeyForgetPassword = GlobalKey<FormState>();

  // RESET PASSWORD
  TextEditingController resetpasswordController = TextEditingController();
  TextEditingController confirmResetpasswordController =
      TextEditingController();
  var resetPasswordformKey = GlobalKey<FormState>();

  bool isPassword1 = true;
  bool isPassword2 = true;
  changeVisabilty(int index) {
    if (index == 1) {
      isPassword1 = !isPassword1;
      emit(ChangeVisabilityState());
    } else {
      if (index == 2) {
        isPassword2 = !isPassword2;
        emit(ChangeVisabilityState());
      }
    }
  }
}
