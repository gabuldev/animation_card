import 'package:animation_card/pages/widgets/projects_widget.dart';
import 'package:animation_card/pages/widgets/tasks_widget.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Column(children: <Widget>[

      ProjectsWidget(),

      Expanded(child: TasksWidget())

      ],),
    );
  }
}
