import 'package:rxdart/rxdart.dart';


class BlocTasks{

  var lista = BehaviorSubject<List<String>>();

  void createLista(){

    List<String> list = List();

    list.add("ITem 1");
    list.add("ITem 2");
    list.add("ITem 3");
    list.add("ITem 4");

    lista.sink.add(list);


  }


  void dispose(){
    lista.close();
  }

}