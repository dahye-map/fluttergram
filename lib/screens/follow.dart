import 'package:flutter/material.dart';
import 'package:fluttergram/constants/size.dart';
import 'package:fluttergram/utils/profile_image_parser.dart';

class Follow extends StatelessWidget {
  final List<String> users = List.generate(10, (i) => 'user $i');

  ListTile _item(String user) {
    return ListTile(
      leading: CircleAvatar(
        radius: profile_radius,
        backgroundImage: NetworkImage(getProfileImgPath(user)),
      ),
      title: Text(user),
      subtitle: Text('Follow&Unfollow page 작업중~~'),
      trailing: Container(
        height: 30,
        width: 80,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.red[50],
          border: Border.all(color: Colors.black87, width: 0.5),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          'following',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red[700],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return _item(users[index]);
        },
        itemCount: 10,
        separatorBuilder: (context, index) {
          return Divider(
            thickness: 1,
            color: Colors.grey[300],
          );
        },
      ),
    );
  }
}