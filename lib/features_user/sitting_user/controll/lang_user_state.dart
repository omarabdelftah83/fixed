
abstract class LangUserState {}

final class LangUserInitial extends LangUserState {}
class LangUserUpdated extends LangUserState {
  final String language;
  final String country;

  LangUserUpdated(this.language, this.country);
}