import 'package:flutter/material.dart';
import 'package:tictactoe/responsive/responsive.dart';
import 'package:tictactoe/screens/create_room_screen.dart';
import 'package:tictactoe/widgets/custom_button.dart';

import 'join_room_screen.dart';

class MainMenuScreen extends StatelessWidget {
  static String routeName = '/main-menu';
  const MainMenuScreen({Key? key}) : super(key: key);
  void createRoom(BuildContext context) {
    Navigator.pushNamed(context, CreateRoomScreen.routeName);
  }

  void joinRoom(BuildContext context) {
    Navigator.pushNamed(context, JoinRoomScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(ontap: () => createRoom(context), text: 'Create Room'),
            SizedBox(
              height: 20,
            ),
            CustomButton(ontap: () => joinRoom(context), text: 'Join Room'),
          ],
        ),
      ),
    );
  }
}
