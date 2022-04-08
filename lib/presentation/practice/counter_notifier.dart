import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider<List<String>>((ref) {
  return ['Don'];
});

class Practice extends ConsumerWidget {
  Practice({Key? key}) : super(key: key);
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context, ref) {
    List<String> _counter = ref.watch(counterProvider);
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
            ),
            ElevatedButton(
                onPressed: () {
                  ref.read(counterProvider.notifier).state = [
                    controller.text,
                    ..._counter
                  ];
                  controller.clear();
                },
                child: const Text('Button')),
            ..._counter.map((e) => ListTile(
                  title: Text(e),
                  trailing: IconButton(
                      onPressed: () {
                        _counter.remove(e);
                        ref.read(counterProvider.notifier).state = [
                          ..._counter
                        ];
                      },
                      icon: const Icon(Icons.remove_circle)),
                ))
          ],
        ));
  }
}

//...............................................................

class ListNotifier extends StateNotifier<List<String>> {
  ListNotifier() : super([]);

  getTotal() {
    return state.length;
  }

  addData(String newData) {
    state = [...state, newData];
  }

  removeData(String data) {
    state.remove(data);
    state = [...state];
  }

  search(String query) {
    List result = state.where((element) => element == query).toList();
    return result;
  }
}

final listNotifierProvider =
    StateNotifierProvider<ListNotifier, List<String>>((ref) {
  return ListNotifier();
});

class Practice2 extends ConsumerWidget {
  Practice2({Key? key}) : super(key: key);
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context, ref) {
    List<String> _data = ref.watch(listNotifierProvider);
    int totalData = ref.watch(listNotifierProvider.notifier).getTotal();

    return Scaffold(
      appBar: AppBar(),
      body: _data.isEmpty
          ? Center(
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        ref
                            .read(listNotifierProvider.notifier)
                            .addData('He  llo');
                      },
                      child: const Text('Add')),
                  const Text('No Dtaa'),
                ],
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Total data $totalData'),
                // Column(
                //   children: result.map((e) => Text(e)).toList(),
                // ),
                Row(
                  children: [
                    SizedBox(
                      width: 200,
                      child: TextField(
                        controller: controller,
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          final result = ref
                              .watch(listNotifierProvider.notifier)
                              .search(controller.text);
                          log(result.toString());
                        },
                        child: const Text('Add')),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      ref
                          .read(listNotifierProvider.notifier)
                          .addData(controller.text.trim().toUpperCase());
                    },
                    child: const Text('Add')),
                ..._data.map((e) => ListTile(
                      title: Text(e),
                      trailing: IconButton(
                          onPressed: () {
                            ref
                                .read(listNotifierProvider.notifier)
                                .removeData(e);
                          },
                          icon: const Icon(Icons.remove_circle)),
                    ))
              ],
            ),
    );
  }
}
