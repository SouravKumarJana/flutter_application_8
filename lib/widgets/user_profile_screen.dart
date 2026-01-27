import 'package:flutter/material.dart';
import '../models/user.dart';

class UserProfileScreen extends StatelessWidget {
  final User user;

  const UserProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 45,
              backgroundImage: NetworkImage(
                'https://i.pravatar.cc/150?img=${user.id}',
              ),
            ),
            const SizedBox(height: 16),

            Text(
              user.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),
            Text(user.email),

            const SizedBox(height: 24),
            const Divider(),

            ListTile(
              leading: const Icon(Icons.location_city),
              title: Text('City'),
              subtitle: Text(user.address.city),
            ),

            ListTile(
              leading: const Icon(Icons.markunread_mailbox),
              title: Text('Zip Code'),
              subtitle: Text(user.address.zipcode),
            ),

            ListTile(
              leading: const Icon(Icons.business),
              title: Text('Company'),
              subtitle: Text(user.company.name),
            ),
          ],
        ),
      ),
    );
  }
}
