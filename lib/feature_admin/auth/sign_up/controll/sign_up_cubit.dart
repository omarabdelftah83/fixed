import 'dart:io';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:webbing_fixed/feature_admin/auth/sign_up/data/post_services.dart';
import 'package:webbing_fixed/feature_admin/auth/sign_up/model/post_provide_model.dart';
import 'package:webbing_fixed/feature_admin/auth/sign_up/sign_up_export.dart';
import 'package:webbing_fixed/feature_admin/mainlayout/main_layout_admin_page.dart';
import 'package:webbing_fixed/helpers/cache_helper.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final ApiService apiService;
  final GetAllService getAllService;
  final PostService postService;

  // Controllers
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Form Fields
  String name = '';
  String email = '';
  String password = '';
  String phoneNumber = '';
  String confirmPassword = '';

  // Error Messages
  String nameError = '';
  String emailError = '';
  String passError = '';
  String phoneNumberError = '';
  String confirmPasswordError = '';
  String? selectedServiceID;

  // Flags
  bool providesServices = false;
  bool acceptsTermsAndConditions = false;
  bool passwordVisibility = true;
  List<String> serviceItems = [];

  // Image Handling
  File? frontImageFile;
  File? backImageFile;
  File? profileImageFile;
  bool isFrontImageUploading = false;
  bool isBackImageUploading = false;
  bool isProfileImageUploading = false;
  final ImagePicker _imagePicker = ImagePicker();

  SignUpCubit(this.apiService, this.getAllService, this.postService)
      : super(SignUpInitial());

  Future<void> pickImageFromCamera(String imageType) async {
    try {
      final pickedFile =
          await _imagePicker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        switch (imageType) {
          case 'front':
            frontImageFile = File(pickedFile.path);
            isFrontImageUploading = true;
            break;
          case 'back':
            backImageFile = File(pickedFile.path);
            isBackImageUploading = true;
            break;
          case 'profile':
            profileImageFile = File(pickedFile.path);
            isProfileImageUploading = true;
            break;
        }
        emit(ImageUploadingState(imageType));
        await _uploadImage(pickedFile.path, imageType);
      }
    } catch (e) {
      print('Error picking image from camera: $e');
    }
  }

  Future<void> _uploadImage(String imagePath, String imageType) async {
    await Future.delayed(Duration(seconds: 1));

    switch (imageType) {
      case 'front':
        isFrontImageUploading = false;
        break;
      case 'back':
        isBackImageUploading = false;
        break;
      case 'profile':
        isProfileImageUploading = false;
        break;
    }
    emit(ImageUploadCompletedState(imageType));
  }

  Future<void> postServices(BuildContext context) async {
    try {
      emit(SignUpLoading());

      String? token = CacheHelper.getUserId();
      final int? userId = token != null ? int.tryParse(token) : null;
      final int? serviceID =
          selectedServiceID != null ? int.tryParse(selectedServiceID!) : null;

      final servicesRequest = ServicesRequest(
        userId: userId,
        serviceID: serviceID,
        pic_id: frontImageFile,
        pic_id2: backImageFile,
        personlity_pic: profileImageFile,
      );

      print("ServicesRequest: ${await servicesRequest.toMap()}");

      final res = await postService.postServices(servicesRequest);

      res.fold(
        (failure) {
          print('Error: ${failure.message}');
          emit(LoginErrorState(AppString.invalidCredentialsError));
        },
        (success) {
          print('Service posted successfully');
          emit(SignUpLoaded());
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => const MainLayoutPageAdmin()),
          );
        },
      );
    } catch (e) {
      if (e is DioException) {
        print('DioException: ${e.message}');
        print('DioException: ${e.response?.data}');
      } else {
        print('Error in postServices: $e');
      }
      emit(LoginErrorState(e.toString()));
    }
  }

  Future<void> fetchServices() async {
    try {
      emit(SignUpLoading());
      final services = await getAllService.getAll();
      emit(ServicesLoaded(services));
    } catch (e) {
      print('Error in fetchServices: $e');
      emit(LoginErrorState(e.toString()));
    }
  }

  Future<void> buttonSignUp(BuildContext context) async {
    emit(SignUpLoading());

    if (!validateInput()) {
      emit(ValidationErrorState(emailError, passError, nameError,
          confirmPasswordError, phoneNumberError));
      _showSnackbar(context, AppString.validationErrorMessage, Colors.red);
      return;
    }

    if (!acceptsTermsAndConditions) {
      emit(ValidationErrorState(emailError, passError, nameError,
          confirmPasswordError, phoneNumberError));
      _showSnackbar(context, 'يجب قبول الشروط والأحكام', Colors.red);
      return;
    }

    if (!providesServices) {
      emit(ValidationErrorState(emailError, passError, nameError,
          confirmPasswordError, phoneNumberError));
      _showSnackbar(context, 'يجب تحديد إذا كنت تقدم خدمات', Colors.red);
      return;
    }

    if (password != confirmPassword) {
      emit(ValidationErrorState(emailError, passError, nameError,
          AppString.passwordsDoNotMatchError, phoneNumberError));
      _showSnackbar(context, AppString.passwordsDoNotMatchError, Colors.red);
      return;
    }

    final registerRequest = SignUpRequest(
      nameController.text,
      emailAddressController.text,
      passwordController.text,
      confirmPasswordController.text,
      phoneController.text,
      providesServices,
      false,
    );

    print('Register Request: ${registerRequest.toMap()}');

    final res = await apiService.signUp(registerRequest);
    res.fold(
      (failure) {
        print('Error: ${failure.message}');
        emit(LoginErrorState(AppString.invalidCredentialsError));
        _showSnackbar(context, AppString.invalidCredentialsError, Colors.red);
      },
      (success) async {
        if (success.userId != null) {
          await CacheHelper.saveUserId(success.userId.toString());
        }
        print('Success: ${success.message}');
        emit(SignUpLoaded());
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const SignInPageAdmin()),
        );
      },
    );
  }

  void onTermsAndConditionsChanged(bool? value) {
    acceptsTermsAndConditions = value ?? false;
    emit(FieldChangedState());
  }

  void onServiceChanged(bool? value) {
    providesServices = value ?? false;
    emit(FieldChangedState());
  }

  void _showSnackbar(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }

  void changePasswordVisibility() {
    passwordVisibility = !passwordVisibility;
    emit(ChangePasswordVisibilityState());
  }

  bool validateInput() {
    bool isValid = true;

    // Validate Name
    if (name.isEmpty) {
      nameError = AppString.firstNameEmptyError;
      isValid = false;
    } else {
      nameError = '';
    }

    // Validate Email
    if (email.isEmpty) {
      emailError = AppString.emailEmptyError;
      isValid = false;
    } else {
      emailError = '';
    }

    // Validate Password
    if (password.isEmpty) {
      passError = AppString.passwordEmptyError;
      isValid = false;
    } else {
      passError = '';
    }

    // Validate Confirm Password
    if (confirmPassword.isEmpty) {
      confirmPasswordError = AppString.confirmPasswordEmptyError;
      isValid = false;
    } else if (confirmPassword != password) {
      confirmPasswordError = AppString.passwordsDoNotMatchError;
      isValid = false;
    } else {
      confirmPasswordError = '';
    }

    // Validate Phone Number
    if (phoneNumber.isEmpty) {
      phoneNumberError = AppString.phoneNumberEmptyError;
      isValid = false;
    } else {
      phoneNumberError = '';
    }

    return isValid;
  }

  void onChangeEmail(String value) {
    email = value;
    emailError = '';
    emit(FieldChangedState());
  }

  void onChangePass(String value) {
    password = value;
    passError = '';
    emit(FieldChangedState());
  }

  void onChangeName(String value) {
    name = value;
    nameError = '';
    emit(FieldChangedState());
  }

  void onChangeConfirmPassword(String value) {
    confirmPassword = value;
    confirmPasswordError = '';
    emit(FieldChangedState());
  }

  void onChangePhoneNumber(String value) {
    phoneNumber = value;
    phoneNumberError = '';
    emit(FieldChangedState());
  }

  final List<String> termsAndConditions = [
    'مرحبًا بك في In Home، منصتك الرئيسية التي تربط مقدمي الخدمات المهرة في مختلف تخصصات الصيانة المنزلية مع عدد كبير من العملاء. تم تصميم In Home كوسيط سلس، حيث تعمل على تبسيط عملية مطابقة احتياجات العملاء مع خبرات مقدمي الخدمة. لضمان تحقيق أفضل تجربة ممكنة، نطلب منك مراجعة الشروط والأحكام التالية بعناية.',
    'قبول الشروط والأحكام: من خلال استخدام منصة In Home، فإنك توافق على الالتزام بجميع الشروط والأحكام المقررة. إذا كنت لا توافق على أي من الشروط، فيرجى عدم استخدام المنصة.',
    'تقديم الخدمة: يجب أن تكون جميع الخدمات المقدمة عبر المنصة ذات جودة عالية وتتوافق مع المعايير المحددة من قبل In Home. نحن لا نتحمل أي مسؤولية عن جودة الخدمات المقدمة من قبل مقدمي الخدمة.',
    'تعديلات الشروط: تحتفظ In Home بالحق في تعديل الشروط والأحكام في أي وقت دون إشعار مسبق. يرجى مراجعة هذه الشروط بانتظام لضمان اطلاعك على أي تغييرات قد تطرأ.',
  ];
}
