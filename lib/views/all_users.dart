import 'package:e_commerce_admin/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllUsers extends ConsumerWidget {
  const AllUsers({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("All Users"),
      ),
      body: users.when(data: (data) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(data[index].name),
              subtitle: Text(data[index].phone),
            );
          },
        );
      }, error: (err, StackTrace) {
        return Text(err.toString());
      }, loading: () {
        return Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
