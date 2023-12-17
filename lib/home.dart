import 'package:bewara/detail.dart';
import 'package:bewara/models/user.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String email;
  const HomePage({super.key, required this.email});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> users = [];
  bool isLoading = true;

  void fetchUser() async {
    isLoading = true;
    Future.delayed(const Duration(milliseconds: 1000), () {
      users = userLists;
      setState(() {});
    });
    isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Users'),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.blue,
                strokeWidth: 10,
              ),
            )
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return DetailScreen(user: user);
                      }));
                    },
                    child: Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(user.avatar),
                        ),
                        title: Text('${user.first_name} ${user.last_name}'),
                        subtitle: Text(user.email),
                      ),
                    ));
              },
            ),
    );
  }
}
