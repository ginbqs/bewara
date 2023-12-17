import 'package:bewara/models/user.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final User user;
  const DetailScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${user.first_name} ${user.last_name}'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image(
                        image: NetworkImage(user.avatar),
                        loadingBuilder: (context, child, loadingProgress) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        errorBuilder: (context, object, stack) {
                          return Container(
                            child: Icon(
                              Icons.person_2_rounded,
                              color: Colors.white,
                              size: 130,
                            ),
                          );
                        }),
                  ),
                ),
              ),
              Profile(
                title: 'Name',
                value: '${user.first_name} ${user.last_name}',
                iconData: Icons.person,
              ),
              Profile(
                title: 'Email',
                value: '${user.email}',
                iconData: Icons.email,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  final String title, value;
  final IconData iconData;

  const Profile(
      {super.key,
      required this.title,
      required this.value,
      required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(title),
          leading: Icon(iconData),
          trailing: Text(
            value,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
