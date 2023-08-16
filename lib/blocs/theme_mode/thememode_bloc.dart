import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:justthelyrics/global.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'thememode_event.dart';
part 'thememode_state.dart';

class ThememodeBloc extends Bloc<ThememodeEvent, ThememodeState> {
  ThememodeBloc() : super(ThememodeInitial()) {
    Future<void> _changeThemeMode(
        ThemeMode mode, Emitter<ThememodeState> emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      try {
        // final _t = prefs.getInt('themeMode') ?? 'system';
        if (mode == ThemeMode.dark) {
          prefs.setInt(kTHEMEMODE, TheMode().light);
          emit(ThemeModeLight());
        } else if (mode == ThemeMode.light) {
          prefs.setInt(kTHEMEMODE, TheMode().dark);
          emit(ThemeModeDark());
        } else {
          prefs.setInt(kTHEMEMODE, TheMode().light);
          emit(ThemeModeLight());
        }
      } catch (e) {
        emit(ThemeModeLight());
        prefs.setInt(kTHEMEMODE, TheMode().light);
      }
    }

    Future<void> _initThemeMode(
        ThemeMode mode, Emitter<ThememodeState> emit) async {
      try {
        if (mode == ThemeMode.dark) {
          emit(ThemeModeDark());
        } else if (mode == ThemeMode.light) {
          emit(ThemeModeLight());
        } else {
          emit(ThemeModeLight());
        }
      } catch (e) {
        emit(ThemeModeLight());
      }
    }

    Future<void> _getThemeMode(Emitter<ThememodeState> emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      try {
        final _t = prefs.getInt(kTHEMEMODE) ?? 'light';
        if (_t == TheMode().dark) {
          emit(ThemeModeDark());
        } else if (_t == TheMode().light) {
          emit(ThemeModeLight());
        } else {
          emit(ThemeModeLight());
        }
      } catch (e) {
        emit(ThemeModeLight());
      }
    }

    on<CurrentThemeRequested>((event, emit) {
      _getThemeMode(emit);
    });
    on<ThememodeEventInit>((event, emit) async {
      await _initThemeMode(event.mode, emit);
    });

    on<ThemeModeChanged>((event, emit) async {
      await _changeThemeMode(event.mode, emit);
    });
  }
}
