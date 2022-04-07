import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/logic/search_provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();
  String query = 'nepal';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            color: Colors.black,
            onPressed: () {
              setState(() {
                query = _controller.text;
              });
            },
            icon: const Icon(
              Icons.search,
            ),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Container(
          color: Colors.yellow,
          child: TextField(
            controller: _controller,
          ),
        ),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final _data = ref.watch(searchProvider(query));
          return _data.when(
            data: (_searches) {
              return _searches.isEmpty
                  ? const Center(
                      child: Text('No Results found'),
                    )
                  : Column(
                      children: [
                        Text('Total results: ${_searches.length}'),
                        ..._searches.map((e) => ListTile(
                              title: Text(e.title ?? 'Abhishek'),
                            ))
                      ],
                    );
            },
            error: (err, s) => Text(err.toString()),
            loading: () => const CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
