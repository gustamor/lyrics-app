part of 'favorites_bloc.dart';

@immutable
abstract class FavoritesState {}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoading extends FavoritesState {}

class IsFavorite extends FavoritesState {
  final bool isFavorite;
  IsFavorite(this.isFavorite);
}

class UpdatedFavorites extends FavoritesState {
  final List<String>? favorites;
  UpdatedFavorites(this.favorites);
}
class LoadedFavorites extends FavoritesState {
  final List<String>? favorites;
  LoadedFavorites(this.favorites);
}
class Error extends FavoritesState {
  final String error;
  Error(this.error);
}