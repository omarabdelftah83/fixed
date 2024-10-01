class OnBoardingState {}

class OnBoardingInitial extends OnBoardingState {}

class OnBoardingUpdated extends OnBoardingState {
  final String language;
  final String country;

  OnBoardingUpdated(this.language, this.country);
}