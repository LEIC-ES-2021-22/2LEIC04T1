import 'package:flutter/cupertino.dart';
import 'package:uni/controller/exam.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/exam.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/view/Widgets/exam_page_title_filter.dart';
import 'package:uni/view/Widgets/row_container.dart';
import 'package:uni/view/Widgets/schedule_row.dart';
import 'package:uni/view/Widgets/title_card.dart';

import '../../model/entities/lecture.dart';
import '../Widgets/schedule_slot.dart';

class EnrollmentsPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => EnrollmentPageViewState();
}

Widget Build_Course_card(String Name, String Schedule, String Teacher){

  return Container(
        width: 300,
        height: 200,
        padding: new EdgeInsets.all(10.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.grey,
          elevation: 10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
               ListTile(
                //leading: Icon(Icons.album, size: 60),
                title: Text(
                    Name,
                    style: TextStyle(fontSize: 30.0)
                ),
                subtitle: Text(
                    Teacher,
                    style: TextStyle(fontSize: 18.0)
                ),
              ),
              Positioned(
                top: 100,
                child: ElevatedButton(
                  child: const Text('Horário'),
                  onPressed: () {/* ... */},
                )
              )
            ],
          ),
        ),
      );

}


class Course {
  String Name;
  String Schedule;
  String Teacher;

  Course(String Name, String Schedule, String Teacher) {
    this.Name = Name;
    this.Schedule = Schedule;
    this.Teacher = Teacher;
  }
}


/// Tracks the state of `Enrollment`.
class EnrollmentPageViewState extends SecondaryPageViewState {
  final double borderRadius = 10.0;


  List<Course> getCourses(lectures, BuildContext context) {
    List<Course> courses = <Course>[];
    Course esof = Course("Engenharia de Software",
        "https://sigarra.up.pt/feup/pt/hor_geral.ucurr_view?pv_ocorrencia_id=484425&pv_ano_lectivo=2021&pv_periodos=3",
        "João Pascoal Faria");
    Course lcom = Course("Laboratório de Computadores",
        "https://sigarra.up.pt/feup/pt/hor_geral.ucurr_view?pv_ocorrencia_id=484426&pv_ano_lectivo=2021&pv_periodos=3",
        "Pedro Souto");
    courses.add(esof);
    courses.add(lcom);


/*    final List<String> courses = <String>[];
    for (int i = 0; i < lectures.length; i++) {
      final Lecture lecture = lectures[i];
      courses.add(lecture.subject);
    }*/
    return courses;
  }

  @override
  Widget getBody(BuildContext context) {
    dynamic lectures;

    List<Course> courses = getCourses(lectures, context);
    List<Widget> c = <Widget>[];
    for (int i = 0; i < courses.length; i++) {
      c.add(Build_Course_card(courses[i].Name, courses[i].Schedule, courses[i].Teacher));
    }
    return ListView(
        children: <Widget>[
          Container(
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: c
              )
          )
        ]
    );


/*    final MediaQueryData queryData = MediaQuery.of(context);
    //dynamic lectures;
    List<String> courses = getCourses(lectures, context);
    List<Widget> c;
    for (int i = 0; i < courses.length; i++) {
        c.add(Text(courses[i]));
    }
    return ListView(
      children: <Widget>[
    Container(
    child: Column(
      mainAxisSize: MainAxisSize.max,
      children: c
    )
    )
    ]
    );*/
  }


}
