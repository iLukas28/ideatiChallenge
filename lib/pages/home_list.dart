import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ideati_ilukas/controller/home_controller.dart';
import 'package:ideati_ilukas/models/joke.dart';

class HomeList extends StatelessWidget {
  const HomeList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'joke',
      builder: (_) => _.jokes.length > 0
          ? ListView.builder(
              itemCount: _.jokes.length,
              itemBuilder: (context, index) {
                Joke item = _.jokes[index];
                if (_.jokes.length == index + 1) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(3),
                        child: ListTile(
                          contentPadding: EdgeInsets.all(5),
                          tileColor: Color.fromRGBO(243, 249, 254, 1),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: SvgPicture.network(
                              item.avatar,
                              width: 50,
                              height: 50,
                              placeholderBuilder: (context) {
                                return CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.black),
                                );
                              },
                            ),
                          ),
                          title: Text(
                            item.joke,
                            textAlign: TextAlign.justify,
                            style: TextStyle(color: Colors.black),
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                  icon: Icon(
                                    FontAwesomeIcons.solidThumbsUp,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    _.addLike(index);
                                  }),
                              Text(
                                item.likes.toString(),
                                style: TextStyle(color: Colors.black),
                              ),
                              IconButton(
                                  icon: Icon(
                                    FontAwesomeIcons.solidThumbsDown,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    _.removeLike(index);
                                  }),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3),
                        child: ListTile(
                          contentPadding: EdgeInsets.all(15),
                          tileColor: Color.fromRGBO(243, 249, 254, 1),
                          subtitle: FloatingActionButton(
                            backgroundColor: Colors.black,
                            onPressed: _.loadJoke,
                            child: Icon(Icons.add, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Padding(
                    padding: EdgeInsets.all(3),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(5),
                      tileColor: Color.fromRGBO(243, 249, 254, 1),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: SvgPicture.network(
                          item.avatar,
                          width: 50,
                          height: 50,
                          placeholderBuilder: (context) {
                            return CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.black),
                            );
                          },
                        ),
                      ),
                      title: Text(
                        item.joke,
                        textAlign: TextAlign.justify,
                        style: TextStyle(color: Colors.black),
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                              icon: Icon(
                                FontAwesomeIcons.solidThumbsUp,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                _.addLike(index);
                              }),
                          Text(
                            item.likes.toString(),
                            style: TextStyle(color: Colors.black),
                          ),
                          IconButton(
                              icon: Icon(
                                FontAwesomeIcons.solidThumbsDown,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                _.removeLike(index);
                              }),
                        ],
                      ),
                    ),
                  );
                }
              },
            )
          : Padding(
              padding: EdgeInsets.all(3),
              child: ListTile(
                contentPadding: EdgeInsets.all(15),
                tileColor: Color.fromRGBO(243, 249, 254, 1),
                subtitle: FloatingActionButton(
                  backgroundColor: Colors.black,
                  onPressed: _.loadJoke,
                  child: Icon(Icons.add, color: Colors.white),
                ),
              ),
            ),
    );
  }
}
