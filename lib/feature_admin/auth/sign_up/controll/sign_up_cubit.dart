import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:webbing_fixed/core/resource/app_string.dart';
import 'package:webbing_fixed/feature_admin/auth/sign_in/sign_in_page.dart';
import 'package:webbing_fixed/feature_admin/auth/sign_up/model/api_service.dart';
import 'package:webbing_fixed/feature_admin/auth/sign_up/model/sign_up_model.dart';
import 'sign_up_state.dart';


class SignUpCubit extends Cubit<SignUpState> {
  final ApiService apiService;
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String name = '';
  String nameError = '';
  String email = '';
  String emailError = '';
  String password = '';
  String passError = '';
  String phoneNumber = '';
  String phoneNumberError = '';
  String confirmPassword = '';
  String confirmPasswordError = '';
  bool providesServices = false;
  SignUpCubit(this.apiService) : super(SignUpInitial());
  final List<String> termsAndConditions = [
    'مرحبًا بك في In Home، منصتك الرئيسية التي تربط مقدمي الخدمات المهرة في مختلف تخصصات الصيانة المنزلية مع عدد كبير من العملاء. تم تصميم In Home كوسيط سلس، حيث تعمل على تبسيط عملية مطابقة احتياجات العملاء مع خبرتك. سواء كنت بارعًا في حرفة ما أو كهربائيًا أو سباكًا، أو أي تخصص آخر في الخدمات المنزلية، يوفر لك تطبيقنا الفرصة لتوسيع قاعدة عملائك دون عناء. انضم إلينا اليوم لتعزيز دخلك والوصول إلى جمهور أوسع من العملاء المحتملين.',
    'تحكم الشروط والأحكام التالية استخدامك لتقديم خدمات الصيانة المنزلية عن طريق تطبيق إن هوم. باستخدام تطبيقنا إن هوم فأنك توافق على الالتزام بالشروط والأحكام التالية:',
    '1. *رسوم العمولة*: نتقاضى عمولة قدرها 10% من إجمالي قيمة الطلب مقابل الخدمات المقدمة عبر تطبيقنا.',
    '2. *تكلفة المصنعية*: السعر المعروض للعميل يغطي تكلفة المصنعية فقط ولا تشمل تكلفة المواد التي سيتم تحديدها بشكل منفصل.',
    '3. *تكلفة المواد*: سيتم تقييم تكلفة المواد اللازمة للخدمة وتقديمها للعميل بعد الفحص. يحق للعميل قبول أو رفض تكلفة المواد المقترحة.',
    '4. *إلغاء الطلب*: إذا قمت بإلغاء طلب بعد تأكيده، فسوف تخضع لغرامة قدرها 10 جنيه مصري، والتي سيتم خصمها من أي أرباح مستقبلية.',
    '5. *الشكاوى وإنهاء الحساب*: أي شكاوى مستلمة عنك قد تؤدي إلى إلغاء حسابك لضمان جودة الخدمة. إذا تم إلغاء حسابك، فلن تتمكن من إعادة التسجيل مرة أخرى.',
    '6. *السلوك المهني*: يُتوقع منك الحفاظ على المظهر والسلوك المهني عند التفاعل مع العملاء. ويشمل ذلك الالتزام بالمواعيد، الأدب، والنظافة.',
    '7. *التواصل*: وسيلة التواصل الأساسية مع إن هوم لأي مشكلة أو استفسار هي من خلال رقم خدمة عملاء إن هوم: 01220267627.',
    '8. *التفاعل مع العملاء*: يجب على مقدمي الخدمة إثبات الكفاءة في التعامل مع مختلف أنواع العملاء بمهنية واحترام.',
    '9. *مدفوعات العمولة*: بعد قيام العميل بالدفع، يجب دفع العمولة المستحقة على الفور. سيظهر مبلغ العمولة في محفظتك بالسالب ولديك 48 ساعة لسداد العمولة عبر فوري.',
    '10. *التقييم والتعليقات*: في ختام كل طلب، يكون لديك خيار تقييم العميل وترك التعليقات بناءً على تجربة الخدمة.',
    '11. *التسجيل والاستخدام*: يتطلب التسجيل إكمال جميع الحقول الإلزامية، بما في ذلك الاسم ورقم الهاتف وتحميل صورة البطاقة وفتح الكاميرا لالتقاط صورة تظهر وجهك.',
    '12. *قبول الخدمة*: عند تلقي طلب خدمة من العميل، لديك خيار قبول العرض أو رفضه. في حالة قبول طلب الخدمة، حدد تكلفة الخدمة (باستثناء تكاليف المواد).',
    'يرجى ملاحظة أن هذه الشروط قابلة للتغيير، وتقع على عاتقك مسؤولية مراجعتها بشكل دوري.'
  ];

  Future<void> buttonSingUp(BuildContext context) async {
    emit(SingUpLoading());

    if (!validateInput()) {
      emit(ValidationErrorState(emailError, passError, nameError,
          confirmPasswordError, phoneNumberError));
      _showSnackbar(context, AppString.validationErrorMessage, Colors.red);
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
        false
    );

    print('Register Request: ${registerRequest.toMap()}');

    final res = await apiService.signUp(registerRequest);
    res.fold(
          (failure) {
        print('Error: ${failure.message}');
        emit(LoginErrorState(AppString.invalidCredentialsError));
        _showSnackbar(context, AppString.invalidCredentialsError, Colors.red);
      },
          (success) {
        print('Success: ${success.message}');
        emit(SingUpLoaded());
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const SignInPageAdmin()),
        );
      },
    );
  }

  void _showSnackbar(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }

  bool passwordVisability = true;

  void changePasswordVisability() {
    passwordVisability = !passwordVisability;
    emit(ChangePasswordVisabilityState());
  }

  bool validateInput() {
    bool isValid = true;

    if (name.isEmpty) {
      nameError = AppString.firstNameEmptyError;
      isValid = false;
    } else {
      nameError = '';
    }

    if (email.isEmpty) {
      emailError = AppString.emailEmptyError;
      isValid = false;
    } else {
      emailError = '';
    }

    if (password.isEmpty) {
      passError = AppString.passwordEmptyError;
      isValid = false;
    } else {
      passError = '';
    }

    if (confirmPassword.isEmpty) {
      confirmPasswordError = AppString.confirmPasswordEmptyError;
      isValid = false;
    } else if (confirmPassword != password) {
      confirmPasswordError = AppString.passwordsDoNotMatchError;
      isValid = false;
    } else {
      confirmPasswordError = '';
    }

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
}
