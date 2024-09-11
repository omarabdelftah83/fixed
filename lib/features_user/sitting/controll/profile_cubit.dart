import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  XFile? profilePic;
  uploadProfilePic(XFile image) {
    profilePic = image;
    emit(UploadProfilePic());
  }
}