import 'package:flutter/cupertino.dart';
import 'package:uni/controller/load_info.dart';
import 'package:uni/controller/exam.dart';
import 'package:uni/controller/mock_get_info.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/exam.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/view/Widgets/exam_page_title_filter.dart';
import 'package:uni/view/Widgets/row_container.dart';
import 'package:uni/view/Widgets/schedule_row.dart';
import 'package:uni/view/Widgets/title_card.dart';

import 'dart:io';
import 'package:uni/model/entities/course.dart';
import 'package:flutter/material.dart';
import 'package:uni/view/Pages/unnamed_page_view.dart';

//import '../../lib/controller/mock_get_info.dart';
import '../../model/entities/course.dart';

import 'package:uni/view/Widgets/account_info_card.dart';
import 'package:uni/view/Widgets/course_info_card.dart';
import 'package:uni/view/Widgets/print_info_card.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../model/entities/lecture.dart';
import '../Widgets/schedule_slot.dart';

class EnrollmentsPageView extends StatefulWidget {
  //final List<Course> courses = get_courses();
  @override
  State<StatefulWidget> createState() => EnrollmentPageViewState(/*courses: courses*/);
}

Widget Build_Course_card(Course course){

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
                    course.name,
                    style: TextStyle(fontSize: 30.0, color: Colors.black, fontWeight: FontWeight.bold)
                ),
                subtitle: Text(
                    course.currYear,
                    style: TextStyle(fontSize: 18.0, color: Colors.lightBlueAccent)
                ),
              ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child:ElevatedButton(
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
                  child: const Text('Horário'),
                  //Solução temporária
                  onPressed: () async {
                    final url = course.id;
/*                    if(await canLaunch(url)){
                      await launch(url,forceSafariVC: true, forceWebView: true, enableJavaScript: true);
                    }*/
                  }, //Use navigator to open new page with uc info
                )
                )
            ],
          ),
        ),
      );

}


/// Tracks the state of `Enrollment`.
class EnrollmentPageViewState extends UnnamedPageView {
  final double borderRadius = 10.0;

  final List<Course> courses = get_courses();

  @override
  Widget getBody(BuildContext context) {

    List<Widget> c = <Widget>[];
    for (var i = 0; i < courses.length; i++) {
      c.add(Build_Course_card(courses[i]));
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

  }


}
