part of 'favorites_bloc.dart';

@immutable
abstract class FavoritesEvent {}

class DidFavorite extends FavoritesEvent {
  final String id;
  DidFavorite({required this.id});
}

class UndoneFavorite extends FavoritesEvent {
  final String id;
  UndoneFavorite({required this.id});
}

class LoadFavorites extends FavoritesEvent {}

class DeleteAllFavoritesPressed extends FavoritesEvent {}
