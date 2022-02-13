import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zam/core/extension/context_extension.dart';
import 'package:zam/widgets/custom_app_bar.dart';

import '../auth/auth_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: 'Profil',
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                context.navigateToRemoveUntil(AuthView());
              },
              icon: Icon(Icons.logout))
        ],
      ),
    );
  }
}
