import 'package:flutter/material.dart';
import 'package:lesson_network/models/post_model.dart';
import 'package:lesson_network/service/https_service.dart';
import 'package:lesson_network/service/log_service.dart';

class NetworkPage extends StatefulWidget {
  const NetworkPage({super.key});

  @override
  State<NetworkPage> createState() => _NetworkPageState();
}

class _NetworkPageState extends State<NetworkPage> {
  @override
  void initState() {
    super.initState();
    //_apiGet();
    var post = Post(userId: "101", title: "Flutter", body: "MODULE-6", id: 1);
    //_apiPostCreate(post);
    // _apiPostUpdate(post);
    _apiDelete(post);
  }

  void _apiGet() {
    Network.GET(Network.API_LIST, Network.paramsEmpty())
        .then((response) => {LogService.i(response.toString())});
  }

  void _apiPostCreate(Post post) {
    Network.POST(Network.API_CREATE, Network.paramsCreate(post))
        .then((response) => {LogService.w(response.toString())});
  }

  void _apiPostUpdate(Post post) {
    Network.PUT(
            Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post))
        .then((response) => {LogService.e(response.toString())});
  }

  void _apiDelete(Post post) {
    Network.DEL(Network.API_DELETE + post.id.toString(), Network.paramsEmpty())
        .then((response) {
      return LogService.i(response.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: () {},
          color: Colors.red,
          child: const Text(
            "Welcome",
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
        ),
      ),
    );
  }
}
