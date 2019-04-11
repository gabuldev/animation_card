import 'package:animation_card/pages/bloc/bloc_tasks.dart';
import 'package:animation_card/pages/widgets/listtile_animation.dart';
import 'package:flutter/material.dart';


class TasksWidget extends StatefulWidget {
  @override
  _TanksWidgetState createState() => _TanksWidgetState();
}

class _TanksWidgetState extends State<TasksWidget> {

  var bloc = BlocTasks();

  @override
  void initState() {
    bloc.createLista();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[

      Row(children: <Widget>[
        Text("TASKS")
      ],)  ,

      Expanded(
        child: StreamBuilder<List<String>>(
          stream: bloc.lista.stream,
          builder: (context, snapshot) {
            return snapshot.hasData ? ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context,index){
                  return ListTileAnimation(bloc: bloc, item: snapshot.data[index],);
                }) : Container();
          }
        ),
      )

    ],);
  }
}
