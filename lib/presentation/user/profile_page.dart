import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/logic/user_data_provider.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _user = ref.watch(userDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      body: _user.when(
          data: (_data) {
            return Column(
              children: [
                Text(_data.email),
                Text(_data.name),
                Text(_data.password)
              ],
            );
          },
          error: (s, e) => Text(e.toString()),
          loading: () => const CircularProgressIndicator()),
    );
  }
}
