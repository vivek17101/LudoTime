import 'package:socket_io_client/socket_io_client.dart' as IO;

class MultiplayerService {
  late IO.Socket socket;

  void initSocket() {
    socket = IO.io("http://localhost:3000", {
      "transports": ["websocket"],
      "autoConnect": true,
    });

    socket.onConnect((_) => print("Connected: ${socket.id}"));
    socket.onDisconnect((_) => print("Disconnected"));

    socket.on("room-created", (roomId) => print("Room created: $roomId"));
    socket.on("player-joined", (id) => print("Player joined: $id"));
    socket.on("match-found", (data) => print("Match found: $data"));
    socket.on("room-error", (msg) => print("Room error: $msg"));
  }

  void createPrivateRoom(String roomId) {
    socket.emit("create-room", roomId);
  }

  void joinPrivateRoom(String roomId) {
    socket.emit("join-room", roomId);
  }

  void startMatchmaking() {
    socket.emit("find-match");
  }
}
