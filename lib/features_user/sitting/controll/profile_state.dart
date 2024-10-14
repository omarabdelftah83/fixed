
import 'package:webbing_fixed/feature_admin/home/model/get_user_model.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileUpdated extends ProfileState {

}
class ProfileDataLoaded extends ProfileState {
  final List<GetUserModel> users;
  ProfileDataLoaded( this.users);
}
class ProfileError extends ProfileState {
  final String message;

  ProfileError(this.message);
}

final class UploadProfilePic extends ProfileState {}
