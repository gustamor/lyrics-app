abstract class SearchEvent {}

class SearchInitialized extends SearchEvent {}

class KeyPressed extends SearchEvent {
  final String key;
  KeyPressed(this.key);
}

class CharDeleted extends SearchEvent {
  final String text;
  CharDeleted(this.text);
}
