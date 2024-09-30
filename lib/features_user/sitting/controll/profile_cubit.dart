import 'package:fluttertoast/fluttertoast.dart';
import 'package:webbing_fixed/features_user/sitting/setting_export.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final UpdateUserProfile userProfile;

  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController anotherPhoneController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController lanController = TextEditingController();

  String oldUsername = '';
  String oldLocation = '';
  String oldPhone = '';
  String oldAnotherPhone = '';
  String oldCountry = '';
  String oldLan = '';

  ProfileCubit(this.userProfile) : super(ProfileInitial());

  XFile? profilePic;

  void uploadProfilePic(XFile image) {
    profilePic = image;
    emit(UploadProfilePic());
  }

  Future<void> updateUser(BuildContext context) async {
    emit(ProfileLoading());

    final newUsername = nameController.text.isNotEmpty ? nameController.text : null;
    final newLocation = locationController.text.isNotEmpty ? locationController.text : null;
    final newPhone = phoneController.text.isNotEmpty ? phoneController.text : null;

    if (newUsername == null && newLocation == null && newPhone == null) {
      Fluttertoast.showToast(
        msg: "يرجى ملء حقل واحد على الأقل.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      emit(ProfileInitial());
      return;
    }

    final updateUserRequest = UpdateUserRequest(
      username: newUsername ?? oldUsername,
      location: newLocation ?? oldLocation,
      phone: newPhone ?? oldPhone,
    );

    final response = await userProfile.updateUser(updateUserRequest);
    response.fold(
          (failure) {
        emit(ProfileError(failure.message));
        Fluttertoast.showToast(
          msg: "حدث خطأ أثناء التحديث: ${failure.message}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      },
          (user) {
        emit(ProfileUpdated());

        nameController.clear();
        phoneController.clear();
        locationController.clear();

        Fluttertoast.showToast(
          msg: "تم التحديث بنجاح.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );

        Navigator.pop(context);
      },
    );
  }
}
