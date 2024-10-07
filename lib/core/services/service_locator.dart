import 'package:get_it/get_it.dart';
import 'package:webbing_fixed/feature_admin/auth/sign_up/controll/sign_up_cubit.dart';
import 'package:webbing_fixed/feature_admin/auth/sign_up/data/get_all_service.dart';
import 'package:webbing_fixed/feature_admin/auth/sign_up/data/post_services.dart';
import 'package:webbing_fixed/feature_admin/home/controll/home_cubit.dart';
import 'package:webbing_fixed/feature_admin/home/data/get_all_order.dart';
import 'package:webbing_fixed/feature_admin/home/data/get_user_data.dart';
import 'package:webbing_fixed/feature_admin/home/data/post_price_data.dart';
import 'package:webbing_fixed/feature_admin/orders/controll/order_cubit.dart';
import 'package:webbing_fixed/feature_admin/orders/data/get_all_order_accept.dart';
import 'package:webbing_fixed/feature_admin/orders/data/get_all_order_cancel.dart';
import 'package:webbing_fixed/feature_admin/orders/data/get_all_order_complete.dart';
import 'package:webbing_fixed/features_user/auth/create_new_passwored/cotroll/create_new_password_cubit.dart';
import 'package:webbing_fixed/features_user/auth/forget_passwored/controll/reset_password_cubit.dart';
import 'package:webbing_fixed/features_user/auth/sing_up/controll/sign_up_user_cubit.dart';
import 'package:webbing_fixed/features_user/auth/verification/controll/otp_cubit.dart';
import 'package:webbing_fixed/features_user/home/controll/home_user_cubit.dart';
import 'package:webbing_fixed/features_user/home/data/create_order_user.dart';
import 'package:webbing_fixed/features_user/home/data/order_service.dart';
import 'package:webbing_fixed/features_user/onboarding/controll/on_boarding_cubit.dart';
import 'package:webbing_fixed/features_user/onboarding/data/country_repository.dart';
import 'package:webbing_fixed/features_user/order/controll/orders_cubit.dart';
import 'package:webbing_fixed/features_user/order/data/get_order_accept.dart';
import 'package:webbing_fixed/features_user/order/data/get_order_cancel.dart';
import 'package:webbing_fixed/features_user/order/data/get_order_complete.dart';
import 'package:webbing_fixed/features_user/order/data/review_data.dart';
import 'package:webbing_fixed/features_user/sitting/controll/profile_cubit.dart';
import 'package:webbing_fixed/features_user/sitting/data/update_user_profile.dart';
import 'package:webbing_fixed/features_user/sitting_user/controll/lang_user_cubit.dart';
import '../../network/api_service.dart';

GetIt serLoc = GetIt.instance;
class ServiesLcator{
  void init(){

    serLoc.registerLazySingleton(() => ApiService());
    serLoc.registerLazySingleton(() => GetAllService());
    serLoc.registerLazySingleton(() => PostService());
    serLoc.registerLazySingleton(() => GetAllOrderRepository());
    serLoc.registerLazySingleton(() => GetAllOrderCompleteRepository());
    serLoc.registerLazySingleton(() => GetAllOrderAcceptRepository());
    serLoc.registerLazySingleton(() => GetAllOrderCancelRepository());
    serLoc.registerLazySingleton(() => GetUserRepository());
    serLoc.registerLazySingleton(() => UpdateAdminProfile());
    serLoc.registerLazySingleton(() => ApiCountryService());
    serLoc.registerLazySingleton(() => ApiOfferPriceService());
    serLoc.registerLazySingleton(() => GetAllOrderCompleteUserRepository());
    serLoc.registerLazySingleton(() => GetAllOrderAcceptUserRepository());
    serLoc.registerLazySingleton(() => GetAllOrderCancelUserRepository());
    serLoc.registerLazySingleton(() => GetOrderServiceId());
    serLoc.registerLazySingleton(() => CreateOrderService());
    serLoc.registerLazySingleton(() => ReviewService());





    ///cubit ///
    serLoc.registerFactory(() => SignUpCubit(serLoc(),serLoc(),serLoc()));
    serLoc.registerFactory(() => SignUpUserCubit(serLoc(),));
    serLoc.registerFactory(() => ForgetPasswordCubit(serLoc(),));
    serLoc.registerFactory(() => CreateNewPasswordCubit(serLoc(),));
    serLoc.registerLazySingleton(() => HomeCubit(serLoc(),serLoc(),serLoc()));
    serLoc.registerFactory(() => OtpCubit(serLoc(),));
    serLoc.registerLazySingleton(() => OrderCubit(serLoc(),serLoc(),serLoc()));
    serLoc.registerFactory(() => ProfileCubit(serLoc(),));
    serLoc.registerFactory(() => OnBoardingCubit(serLoc(),));
    serLoc.registerFactory(() => OrdersUserCubit(serLoc(),serLoc(),serLoc(),serLoc()));
    serLoc.registerFactory(() => LangUserCubit(serLoc(),));
    serLoc.registerFactory(() => HomeUserCubit(serLoc(),serLoc(),serLoc()));




  }}