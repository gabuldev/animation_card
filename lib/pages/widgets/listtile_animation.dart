import 'package:animation_card/pages/bloc/bloc_tasks.dart';
import 'package:flutter/material.dart';


class ListTileAnimation extends StatefulWidget {

  final BlocTasks bloc;
  final String item;

  ListTileAnimation({this.bloc,this.item});

  @override
  _ListTileAnimationState createState() => _ListTileAnimationState();
}

class _ListTileAnimationState extends State<ListTileAnimation> with TickerProviderStateMixin {

  AnimationController controller;
  AnimationController controller2;
  Animation translate;
  Animation translate2;
  Animation translatedel;
  Animation width;
  Animation opacity;

  @override
  void initState() {
   controller = AnimationController(vsync: this,duration: Duration(milliseconds: 500));
   controller2 = AnimationController(vsync: this,duration: Duration(milliseconds: 400));
   opacity = Tween(begin: 0.0,end: 1.0).animate(CurvedAnimation(parent: controller2, curve: Interval(0.3, 0.9)));
   width = Tween(begin: 0.0,end: 100.0).animate(controller2);
   translate2 = Tween(begin: 300.0, end: 50.0).animate(controller2);
   translate = Tween(begin: 0.0, end: 200.0).animate(controller);
    super.initState();
  }


  @override
  void dispose() {
     controller.dispose();
     controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[


        AnimatedBuilder(
            animation: controller2,
            builder: (context, snapshot) {
              return Transform.translate(
                offset: Offset(translate2.value, 0.0),
                  child: Opacity(
                    opacity: opacity.value,
                    child: Container(
                      color: Colors.orange,
                      height: 40.0,
                      width: width.value,
                      child: IconButton(icon: Icon(Icons.delete,color: Colors.white,), onPressed: () async{

                        var lista = widget.bloc.lista.value;

                        lista.remove(widget.item);
                        translate = Tween(begin:200.0, end: 500.0).animate(controller);
                       controller2.reverse();
                        controller.reset();
                       await controller.forward();
                        translate = Tween(begin: 0.0, end: 200.0).animate(controller);
                        controller.reset();
                        widget.bloc.lista.sink.add(lista);






                      }),
                    ),

                  ),

              );
            }
        ),



        AnimatedBuilder(
          animation: controller,
          builder: (context, snapshot) {
            return Transform.translate(
              offset: Offset(translate.value, 0.0),
              child: GestureDetector(

                onTap: (){
                  if(controller.isDismissed) {
                      controller.forward();
                      controller2.forward();
                  }
                  else if(controller.isCompleted){
                    controller.reverse();
                    controller2.reverse();
                  }
                },

                onHorizontalDragUpdate: (details){
                  controller.value += details.primaryDelta/400.0;
                  controller2.value += details.primaryDelta/300.0;
                },

                onHorizontalDragEnd: (details){

                  if(controller.value > 0.5) {
                    controller.forward();
                    controller2.forward();
                  }
                  else {
                    controller.reverse();
                    controller2.reverse();
                  }

                },

                child: Card(
                  child: ListTile(
                    title: Text("${widget.item}"),
                    subtitle: Text("Subtitle"),
                  ),
                ),
              ),
            );
          }
        ),
      ],
    );
  }
}
