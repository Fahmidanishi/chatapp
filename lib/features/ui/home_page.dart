import 'package:flutter/material.dart';

import '../../common/custom_navigator.dart';
import '../auth/login_page.dart';
import 'chat_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          'Chats',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.amber),
              accountName: Text(
                "Nishi".toUpperCase(),
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              accountEmail: Text(
                "abc@gmail.com",
                style: const TextStyle(color: Colors.black),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.grey.shade300,
                child: const Icon(Icons.person, size: 40, color: Colors.grey),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.messenger),
              title: const Text('Chats'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {

                if (mounted) {
                  customNavigator(context, const LoginPage());
                }
              },
            ),
          ],
        ),
      ),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24),
          SizedBox(
              height: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 32,
                          backgroundImage: NetworkImage(''),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Unknown',
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  );
                },
              ),
          ),
          Divider(color: Colors.grey.withOpacity(0.2),thickness: 8),

          //ALL user list
          Expanded(
            child: ListView.separated(
              itemCount: 10,
              itemBuilder: (context, index) {
                // var userData = users[index].data() as Map<String, dynamic>;
                return ListTile(
                  leading: const CircleAvatar(
                      radius: 24,
                      backgroundImage:NetworkImage(''),
                      child:Icon(Icons.person)
                  ),
                  title: const Text('Unknown',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  onTap: () {
                    customNavigator(context, ChatsPage());
                    // Navigate to chat screen
                  },
                );
              },
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Divider(color: Colors.grey.withOpacity(0.2)),
              ),
            ),
           
          ),
        ],
      ),
    );
  }
}