import 'package:communityapp_firebase/helper/helper_function.dart';
import 'package:communityapp_firebase/pages/Auth/login_page.dart';
import 'package:communityapp_firebase/pages/home_page.dart';
import 'package:communityapp_firebase/pages/search_page.dart';
import 'package:communityapp_firebase/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:communityapp_firebase/service/auth_service.dart';
import 'package:flutter/material.dart';

class ProfilePae extends StatefulWidget {
  String userName;
  String email;
  ProfilePae({Key? key, required this.email, required this.userName})
      : super(key: key);

  @override
  State<ProfilePae> createState() => _ProfilePaeState();
}

class _ProfilePaeState extends State<ProfilePae> {

  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: const Text(
          "Profile",
          style: TextStyle(
              color: Colors.white, fontSize: 27, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 50),
          children: <Widget>[
            Icon(
              Icons.account_circle,
              size: 150,
              color: Colors.grey[700],
            ),
            const SizedBox(height: 16),
            Text(
              "userName",
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
            ),
            const SizedBox(height: 36),
            const Divider(
              height: 2,
            ),
            // ListTile(
            //   onTap: () {},
            //   selectedColor: Theme.of(context).primaryColor,
            //   selected: true,
            //   contentPadding: const EdgeInsets.symmetric(
            //     horizontal: 24,
            //   ),
            //   leading: const Icon(Icons.group),
            //   title: const Text(
            //     "Groups",
            //     style: TextStyle(color: Colors.black, fontSize: 16),
            //   ),
            // ),
            ListTile(
              onTap: () {
                nextscreen(context, HomePage());
              },
              selectedColor: Theme.of(context).primaryColor,
              selected: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              leading: const Icon(Icons.home),
              title: const Text(
                "Home",
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              onTap: () async {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Logout"),
                        content: const Text("Are you sure you want to logout?"),
                        actions: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.cancel,
                              color: Colors.red,
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              await authService.signOut();
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()),
                                  (route) => false);
                            },
                            icon: const Icon(
                              Icons.done,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      );
                    });
              },
              selectedColor: Theme.of(context).primaryColor,
              selected: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              leading: const Icon(Icons.exit_to_app),
              title: const Text(
                "Logout",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.account_circle,
              size: 200,
              color: Colors.grey[700],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Full Name", style: TextStyle(fontSize: 18)),
                Text(widget.userName, style: const TextStyle(fontSize: 18)),
              ],
            ),
            const Divider(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Email", style: TextStyle(fontSize: 18)),
                Text(widget.email, style: const TextStyle(fontSize: 18)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}