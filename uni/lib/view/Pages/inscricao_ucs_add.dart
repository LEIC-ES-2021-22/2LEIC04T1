import 'package:uni/controller/mock_get_info.dart';
import 'package:flutter/material.dart';
import 'package:uni/view/Pages/unnamed_pickup_page_view.dart';
import '../../model/entities/course_unit.dart';

class Add_ucs extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Add_ucsViewState(/*courses: courses*/);
}

/// Tracks the state of `Enrollment`.
class Add_ucsViewState extends UnnamedPickUPPageView {
  final double borderRadius = 10.0;

  final List<CourseUnit> ucs_disponiveis = avaiable_ucs;
  bool checkfirst = true;
  Widget BuildCourse(BuildContext context, CourseUnit UC) {
    Key key_first;
    if(checkfirst){
      key_first = Key("adicionar_uc");
    }
    return (Container(
      width: 300,
      height: 270,
      padding: EdgeInsets.all(10.0),
      child: Card(
          //possible improvement:
        // dinamically change cards height acording to its contents
          margin: EdgeInsets.zero,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none,
          ),
          color: Colors.grey,
          elevation: 10,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                //leading: Icon(Icons.album, size: 60),
                Text(UC.name,
                    style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
                Text(UC.curricularYear.toString(),
                    style: TextStyle(fontSize: 18.0, color: Colors.black45),
                    textAlign: TextAlign.left),
                Text(UC.ects.toString() + " ECTS",
                    style:
                    TextStyle(fontSize: 18.0, color: Colors.lightBlueAccent),
                    textAlign: TextAlign.left),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red)),
                      child: const Text('Adicionar UC'),
                      //Solução temporária
                      onPressed: () async {
                        increver_uc(UC);
                        Navigator.of(context).pop(UC);
                      }, //Use navigator to open new page with uc info
                    ))
              ],
            ),
          )),
    ));
  }

  @override
  Widget getBody(BuildContext context) {
    List<Widget> c = <Widget>[];
    c.add(Text('Adicionar Unidades Curriculares',
        style: TextStyle(
            color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold)));

    for (int i = 0; i < ucs_disponiveis.length; i++) {
      c.add(BuildCourse(context, ucs_disponiveis[i]));
    }

    return ListView(children: <Widget>[
      Container(child: Column(mainAxisSize: MainAxisSize.max, children: c))
    ]);
  }
}
