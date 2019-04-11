import 'package:flutter/material.dart';


class ProjectsWidget extends StatefulWidget {
  @override
  _ProjectsWidgetState createState() => _ProjectsWidgetState();
}

class _ProjectsWidgetState extends State<ProjectsWidget>{

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(children: <Widget>[
      Row(
        children: <Widget>[
          Text("PROJECTS")
        ],
      ),

      SizedBox(
        height: size.height*0.25,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,

            itemBuilder: (context,index){

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  elevation: 3.0,
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    height: 150.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.orange
                    ),
                  ),
                ),
              );
            }),
      )
    ],);
  }
}
