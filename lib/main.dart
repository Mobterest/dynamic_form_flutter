import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic form',
      home: MyHomePage(title: 'Dynamic form'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> litems = [
      {"label": "Username", "obscure": false},
      {"label": "Password", "obscure": true},
      {"label": "Submit", "obscure": false},
    ];

    Map<String, TextEditingController> textEditingControllers = {};

    for (var i = 0; i < litems.length - 1; i++) {
      var textEditingController = new TextEditingController();
      textEditingControllers.putIfAbsent(
          litems[i]['label'], () => textEditingController);
    }

    return Scaffold(
        backgroundColor: Color(0xffffffff),
        appBar: AppBar(
          backgroundColor: Color(0xffffffff),
          bottomOpacity: 0.0,
          elevation: 0.0,
        ),
        body: ListView.builder(
          itemCount: litems.length,
          itemBuilder: (context, index) {
            if (index % (litems.length - 1) == 0 && index != 0)
              return Container(
                  padding: EdgeInsets.only(right: 10, top: 10),
                  child: Flex(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    direction: Axis.vertical,
                    children: [
                      FractionallySizedBox(
                          widthFactor: 0.5,
                          child: RaisedButton(
                            shape: StadiumBorder(),
                            onPressed: () {
                              for (var i = 0; i < litems.length - 1; i++) {
                                print(litems[i]['label'] +
                                    ': ' +
                                    textEditingControllers[litems[i]['label']]
                                        .text);
                              }
                            },
                            child: Text(
                              litems[index]['label'],
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Color(0XFF800200),
                          ))
                    ],
                  ));
            else
              return Container(
                  padding: EdgeInsets.only(left: 10, top: 10, right: 10),
                  child: Flex(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      direction: Axis.vertical,
                      children: <Widget>[
                        TextField(
                            controller:
                                textEditingControllers[litems[index]['label']],
                            autocorrect: true,
                            obscureText: litems[index]['obscure'],
                            decoration: InputDecoration(
                                hintText: litems[index]['label'],
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffd3d3d3))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xff800200))))),
                      ]));
          },
        ));
  }
}
