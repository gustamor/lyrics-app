import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:justthelyrics/bloc_providers/providers.dart';
import 'package:justthelyrics/blocs/search_form/searchform_bloc.dart';
import 'package:justthelyrics/blocs/search_form/searchform_event.dart';
import 'package:justthelyrics/i18n/strings.g.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String? s = t.searchSong;

    return BlocProvider(
      create: (context) => SearchBloc(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: _controller,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: "Type the song you want the lyrics",
            filled: true,
            //   fillColor: Colors.grey[100],
          ),
          onChanged: (text) {
            if (text.isNotEmpty) {
              SearchBlocProvider(context).e.add(KeyPressed(text));
            } else {
              SearchBlocProvider(context).e.add(CharDeleted(text));
            }
          },
        ),
      ),
    );
  }
}
