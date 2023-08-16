import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:justthelyrics/global.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(FavoritesInitial()) {
    Future<void> makeFavorite(String id, Emitter<FavoritesState> emit) async {
      try {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        List<String>? favorites = prefs.getStringList("favorites");
        favorites!.add(id);
        prefs.setStringList("favorites", favorites);
        emit(UpdatedFavorites(favorites));
      } catch (e) {
        emit(Error(e.toString()));
      }
    }

    Future<void> quitFavorite(String id, Emitter<FavoritesState> emit) async {
      try {
        var box = await Hive.openBox(kHiveStored);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        List<String>? favorites = prefs.getStringList("favorites");
        favorites!.remove(id);
        prefs.setStringList("favorites", favorites);
        await box.delete(id);

        emit(UpdatedFavorites(favorites));
      } catch (e) {
        emit(Error(e.toString()));
      }
    }

    Future<void> loadFavorites(Emitter<FavoritesState> emit) async {
      try {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        List<String>? favorites = prefs.getStringList("favorites");
        emit(LoadedFavorites(favorites));
      } catch (e) {
        emit(Error(e.toString()));
      }
    }

    Future<void> deleteAllFavorites(Emitter<FavoritesState> emit) async {
      try {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.remove("favorites");
        try {
          var box = await Hive.openBox(kHiveStored);
          await box.clear();
        } catch (e) {}

        emit(FavoritesInitial());
      } catch (e) {
        emit(Error(e.toString()));
      }
    }

    on<DidFavorite>((event, emit) async {
      await makeFavorite(event.id, emit);
    });
    on<UndoneFavorite>((event, emit) async {
      await quitFavorite(event.id, emit);
    });
    on<LoadFavorites>((event, emit) async {
      await loadFavorites(emit);
    });
    on<DeleteAllFavoritesPressed>((event, emit) async {
      await deleteAllFavorites(emit);
    });
  }
}
