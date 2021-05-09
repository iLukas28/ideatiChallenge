import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ideati_ilukas/controller/home_controller.dart';

import 'home_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        id: 'loading',
        init: HomeController(),
        builder: (_) => Scaffold(
              backgroundColor: Color.fromRGBO(229, 229, 229, 1),
              appBar: AppBar(
                  title: _.loading
                      ? Text('Loading new Joke!')
                      : Text('Ideati Challenge')),
              body: HomeList(),
            ));
  }
}
