import 'package:flutter/material.dart';
import 'package:wordsContextApp/src/pages/users/list/user_list_module.dart';
import 'package:wordsContextApp/src/pages/users/relogin/user_relogin_page.dart';
import 'package:wordsContextApp/src/shared/globals.dart';

class HomeCustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: <Widget>[
      new UserAccountsDrawerHeader(
        accountName: new Text('Valmor Flores'),
        accountEmail: new Text('valmorflores@gmail.com'),
        currentAccountPicture: new CircleAvatar(
            backgroundImage: new NetworkImage('http://i.pravatar.cc/300')),
      ),
      new ListTile(
          title: new Text('Profile'),
          onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserListModule()),
                )
              }),
      new ListTile(
          title: new Text('Network'),
          onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserListModule()),
                )
              }),
      new ListTile(title: new Text('History'), onTap: () => {}),
      new ListTile(title: new Text('Words'), onTap: () => {}),
      new ListTile(title: new Text('Suggestions'), onTap: () => {}),
      new ListTile(title: new Text('Login'), onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserReloginPage()),
                )
      }),
      new ListTile(title: new Text('Logoff'), onTap: () => {})
    ]));
  }
}


