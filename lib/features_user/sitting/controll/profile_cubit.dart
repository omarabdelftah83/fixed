import 'package:fluttertoast/fluttertoast.dart';
import 'package:webbing_fixed/feature_admin/home/data/get_user_data.dart';
import 'package:webbing_fixed/features_user/sitting/setting_export.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final UpdateAdminProfile userProfile;
  final GetUserRepository getUserRepository;

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

  ProfileCubit(this.userProfile, this.getUserRepository) : super(ProfileInitial());

  XFile? profilePic;

  void uploadProfilePic(XFile image) {
    profilePic = image;
    emit(UploadProfilePic());
  }
  Future<void> fetchData() async {
    try {
      emit(ProfileLoading());

      final user = await getUserRepository.getUserData();

      if (user != null) {
        emit(ProfileDataLoaded( [user]));
      } else {
        emit(ProfileError('No user data found'));
      }
    } catch (e) {
      emit(ProfileError('Failed to load data: $e'));
    }
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

    final response = await userProfile.updateAdmin(updateUserRequest);
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
