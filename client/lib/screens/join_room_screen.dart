import 'package:flutter/material.dart';
import 'package:tictactoe/resources/socket_methods.dart';

import '../responsive/responsive.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_field.dart';

class JoinRoomScreen extends StatefulWidget {
  static String routeName = '/join-room';
  const JoinRoomScreen({Key? key}) : super(key: key);

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final TextEditingController _gameIdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _socketMethods.joinRoomSuccessListener(context);
    _socketMethods.errorOccuredListener(context);
    _socketMethods.uppdatePlayersStateListener(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _gameIdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomText(
                  shadows: [Shadow(blurRadius: 40, color: Colors.blue)],
                  text: 'Join Room',
                  fontSize: 70),
              SizedBox(height: size.height * 0.08),
              CustomTextField(
                  controller: _nameController, hintText: 'Enter Your NickName'),
              const SizedBox(height: 20),
              CustomTextField(
                  controller: _gameIdController, hintText: 'Enter Game ID'),
              SizedBox(
                height: size.height * 0.05,
              ),
              CustomButton(
                  ontap: () => _socketMethods.joinRoom(
                      _nameController.text, _gameIdController.text),
                  text: 'Join')
            ],
          ),
        ),
      ),
    );
  }
}
