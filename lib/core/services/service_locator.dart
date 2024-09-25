import 'package:get_it/get_it.dart';
import 'package:webbing_fixed/feature_admin/auth/sign_up/controll/sign_up_cubit.dart';
import 'package:webbing_fixed/feature_admin/auth/sign_up/data/get_all_service.dart';
import 'package:webbing_fixed/feature_admin/auth/sign_up/data/post_services.dart';
import 'package:webbing_fixed/feature_admin/home/controll/home_cubit.dart';
import 'package:webbing_fixed/feature_admin/home/data/get_all_order.dart';
import 'package:webbing_fixed/features_user/auth/create_new_passwored/cotroll/create_new_password_cubit.dart';
import 'package:webbing_fixed/features_user/auth/forget_passwored/controll/reset_password_cubit.dart';
import 'package:webbing_fixed/features_user/auth/sing_up/controll/sign_up_user_cubit.dart';
import 'package:webbing_fixed/features_user/auth/verification/controll/otp_cubit.dart';
import '../../network/api_service.dart';

GetIt serLoc = GetIt.instance;
class ServiesLcator{
  void init(){

    serLoc.registerLazySingleton(() => ApiService());
    serLoc.registerLazySingleton(() => GetAllService());
    serLoc.registerLazySingleton(() => PostService());
    serLoc.registerLazySingleton(() => GetAllOrderRepository());



   ///cubit ///
    serLoc.registerFactory(() => SignUpCubit(serLoc(),serLoc(),serLoc()));
    serLoc.registerFactory(() => SignUpUserCubit(serLoc(),));
    serLoc.registerFactory(() => ForgetPasswordCubit(serLoc(),));
    serLoc.registerFactory(() => CreateNewPasswordCubit(serLoc(),));
    serLoc.registerLazySingleton(() => HomeCubit(serLoc()));
    serLoc.registerFactory(() => OtpCubit(serLoc(),));



  }}