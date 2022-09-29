import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/resources/socket_methods.dart';
import 'package:tictactoe/views/scoreboard.dart';
import 'package:tictactoe/views/tictactoe_board.dart';
import 'package:tictactoe/views/waiting_lobby.dart';

import '../provider/room_data_provider.dart';

class GameScreen extends StatefulWidget {
  static String routeName = '/game';
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final SocketMethods _socketMethods = SocketMethods();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _socketMethods.updateRoomListener(context);
    _socketMethods.uppdatePlayersStateListener(context);
    _socketMethods.pointIncreaseListener(context);
    _socketMethods.endGameListener(context);
  }

  @override
  Widget build(BuildContext context) {
    // print(Provider.of<RoomDataProvider>(context).player1.nickname);
    // print(Provider.of<RoomDataProvider>(context).player2.nickname);
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);
    return Scaffold(
      body: roomDataProvider.roomData['isJoin']
          ? const WaitingLobby()
          : SafeArea(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const ScoreBoard(),
                const TicTacToeBoard(),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.red,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        '${roomDataProvider.roomData['turn']['nickname']}\'s turn',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            )),
    );
  }
}
