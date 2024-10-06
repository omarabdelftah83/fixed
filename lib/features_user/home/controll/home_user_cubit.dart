import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:webbing_fixed/feature_admin/auth/sign_up/data/get_all_service.dart';
import 'package:webbing_fixed/features_user/home/data/order_service.dart';
import 'home_user_state.dart';

class HomeUserCubit extends Cubit<HomeUserState> {
  final GetAllService getAllService;
  final GetOrderServiceId getOrderServiceId;
  final ImagePicker _picker = ImagePicker();
  XFile? _selectedImage;
  TextEditingController imageController = TextEditingController();
  double _containerHeight = 50.0; // ارتفاع الـ Container الافتراضي
  HomeUserCubit(this.getAllService, this.getOrderServiceId) : super(HomeUserInitial());

  int _unitCount = 0;
  String? selectedServiceId;

  void increment() {
    _unitCount++;
    emit(UnitCountChanged(_unitCount)); // Emit a new state with the updated count
  }

  void decrement() {
    if (_unitCount > 0) {
      _unitCount--;
      emit(UnitCountChanged(_unitCount)); // Emit a new state with the updated count
    }
  }

  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _selectedImage = pickedFile;
      imageController.text = pickedFile.path;
      _containerHeight = 150.0;
      emit(ImagePicked(_selectedImage!.path, _containerHeight)); // Emit a new state with the selected image
    } else {
      print("No image selected.");
    }
  }

  @override
  void dispose() {
    imageController.dispose();
    super.close(); // Close the cubit instead of disposing
  }

  Future<void> fetchServices() async {
    try {
      emit(HomeUserLoading());
      final services = await getAllService.getAll();
      emit(ServicesLoaded(services));
    } catch (e) {
      print('Error in fetchServices: $e');
      emit(HomeUserErrorState(e.toString()));
    }
  }

  Future<void> fetchServiceId(int id) async {
    try {
      emit(HomeUserLoading());
      final services = await getOrderServiceId.getServiceId(id);
      emit(ServiceIdLoaded(services));
    } catch (e) {
      print('Error in fetchServices: $e');
      emit(HomeUserErrorState(e.toString()));
    }
  }
}
