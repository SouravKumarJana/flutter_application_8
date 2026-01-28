import 'package:flutter/material.dart';
import '../error_handeling/error_hedeling_helper.dart';
import '../services/user_api_service.dart';
import '../network/dio_client.dart';
import '../models/user.dart';
import 'user_profile_screen.dart';
import 'package:dio/dio.dart';


class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  late final UserApiService _apiService;

  @override
  void initState() {
    super.initState();
    _apiService = UserApiService(DioClient.createDio());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contacts')),
      body: FutureBuilder<List<User>>(
        future: _apiService.getUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            String errorMessage = 'Unexpected error';

            if (snapshot.error is DioException) {
              errorMessage =
                  handleDioError(snapshot.error as DioException);
            }

            return Center(
              child: Text(
                errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          final users = snapshot.data!;

          return ListView.separated(
            itemCount: users.length,
            separatorBuilder: (_, __) =>
                const Divider(height: 0.5),
            itemBuilder: (context, index) {
              final user = users[index];

              return ListTile(
                leading: CircleAvatar(
                  radius: 22,
                  backgroundImage: NetworkImage(
                    'https://i.pravatar.cc/150?img=${user.id}',
                  ),
                ),
                title: Text(user.name),
                subtitle: Text(user.email),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          UserProfileScreen(user: user),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
