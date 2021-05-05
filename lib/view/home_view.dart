import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite_tutorial/helper/database_helper.dart';
import 'package:sqflite_tutorial/models/user.dart';
import 'package:sqflite_tutorial/theme/appDarkTheme.dart';
import 'package:sqflite_tutorial/theme/appLightTheme.dart';
import 'package:sqflite_tutorial/theme/theme_state.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _textEditingController;
  DatabaseHelper databaseHelper = DatabaseHelper();

  var data;

  List<User> userList = [];

  getAllUser() {
    userList.clear();
    databaseHelper.getUser().then((users) {
      for (var user in users) {
        setState(() {
          userList.add(User.fromMap(user));
        });
      }
    });
  }

  @override
  void initState() {
    getAllUser();
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeState>(
      builder: (val) => Scaffold(
        appBar: AppBar(
          title: Text('title'.tr),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  val.changeAppTheme(
                    val.currentTheme == appLightTheme
                        ? appDarkTheme
                        : appLightTheme,
                  );
                },
                child: Icon(
                  val.currentTheme == appLightTheme
                      ? Icons.lightbulb
                      : Icons.lightbulb_outline,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  val.changeLocale(
                    val.locale == Locale('tr', 'TR')
                        ? Locale('en', 'US')
                        : Locale('tr', 'TR'),
                  );
                },
                child: Icon(
                  Icons.language,
                ),
              ),
            ),
          ],
        ),
        body: Center(
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    hintText: 'newuser'.tr,
                  ),
                  onChanged: (val) {
                    setState(() {
                      data = val;
                    });
                  },
                ),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      userList[index].name,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _textEditingController.clear();
            });
            if (data == null) return;
            databaseHelper.addUser(User(data));
            getAllUser();
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
