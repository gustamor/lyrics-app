import 'package:justthelyrics/models/search_ovh_result.dart';

class SearchState {}

class SearchInitial extends SearchState {
  @override
  String toString() {
    return 'SearchInitial';
  }
}

class SearchResult extends SearchState {
  TrackOvhSearchResult? tracks;
  SearchResult(this.tracks);
}

class StartState extends SearchState {
  @override
  String toString() {
    return 'StartState';
  }
}
