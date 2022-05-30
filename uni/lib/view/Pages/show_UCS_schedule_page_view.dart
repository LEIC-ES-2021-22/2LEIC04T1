import 'package:flutter/cupertino.dart';
import 'package:uni/controller/load_info.dart';
import 'package:uni/controller/exam.dart';
import 'package:uni/controller/mock_get_info.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/course_unit.dart';
import 'package:uni/model/entities/exam.dart';
import 'package:flutter/material.dart';
import 'package:uni/utils/constants.dart';
import 'package:uni/view/Pages/unnamed_pickup_page_view.dart';
import 'package:uni/view/Widgets/exam_page_title_filter.dart';
import 'package:uni/view/Widgets/row_container.dart';
import 'package:uni/view/Widgets/schedule_row.dart';
import 'package:uni/controller/schedule_fetcher/schedule_course_fetcher_api.dart';
import 'package:uni/view/Widgets/title_card.dart';
import 'dart:io';
import 'package:uni/model/entities/course.dart';
//import '../../lib/controller/mock_get_info.dart';
import '../../model/entities/course.dart';
import 'package:uni/model/schedule_course_page_model.dart';


class show_UCS_schedule extends StatefulWidget {
  //final List<Course> courses = get_courses();
  @override
  State<StatefulWidget> createState() =>
      Show_UCS_scheculeViewState();
}

Widget Build_Course_card(CourseUnit course, BuildContext context) {

  return Container(
    width: 300,
    height: 270,
    padding: new EdgeInsets.all(10.0),
    child: Card(
        //possible improvement: dinamically change cards height acording to its contents
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
              Text(course.name,
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              Text(course.curricularYear.toString(),
                  style: TextStyle(fontSize: 18.0, color: Colors.black45),
                  textAlign: TextAlign.left),
              Text("\n" + course.ects.toString() + " ECTS\n",
                  style:
                      TextStyle(fontSize: 18.0, color: Colors.lightBlueAccent),
                  textAlign: TextAlign.left),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red)),
                    child: const Text('Horário'),
                    onPressed:    (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => ScheduleCoursePage()));
                      }, //Use navigator to open new page with uc info
                  ))
            ],
          ),
        )),
  );
}

/// Tracks the state of `Enrollment`.
class Show_UCS_scheculeViewState extends UnnamedPickUPPageView {
  final double borderRadius = 10.0;

  final List<CourseUnit> courses = get_ucs();

  @override
  Widget getBody(BuildContext context) {
    List<Widget> c = <Widget>[];
    c.add(Text("Unidades Curriculares atuais:", style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold)));
    for (var i = 0; i < courses.length; i++) {
      c.add(Build_Course_card(courses[i],context));
    }
    return ListView(children: <Widget>[Container(child: Column(mainAxisSize: MainAxisSize.max, children: c))]);
  }























}
