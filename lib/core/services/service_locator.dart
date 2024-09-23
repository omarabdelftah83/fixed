import 'package:get_it/get_it.dart';
import 'package:webbing_fixed/feature_admin/auth/sign_up/controll/sign_up_cubit.dart';
import 'package:webbing_fixed/features_user/auth/create_new_passwored/cotroll/create_new_password_cubit.dart';
import 'package:webbing_fixed/features_user/auth/forget_passwored/controll/reset_password_cubit.dart';
import 'package:webbing_fixed/features_user/auth/sing_up/controll/sign_up_user_cubit.dart';
import 'package:webbing_fixed/features_user/auth/verification/controll/otp_cubit.dart';
import '../../network/api_service.dart';

GetIt serLoc = GetIt.instance;
class ServiesLcator{
  void init(){

    serLoc.registerFactory(() => OtpCubit(serLoc(),));
    serLoc.registerLazySingleton(() => ApiService());
    serLoc.registerFactory(() => SignUpCubit(serLoc(),));
    serLoc.registerFactory(() => SignUpUserCubit(serLoc(),));
    serLoc.registerFactory(() => ForgetPasswordCubit(serLoc(),));
    serLoc.registerFactory(() => CreateNewPasswordCubit(serLoc(),));



  }}