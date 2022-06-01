import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/lecture.dart';
import 'package:flutter/material.dart';
import 'package:uni/model/schedule_course_page_model.dart';
import 'package:uni/view/Widgets/page_title.dart';

import 'package:flutter/cupertino.dart';
import 'package:uni/view/Widgets/row_container.dart';

import 'package:uni/view/Widgets/request_dependent_widget_builder.dart';

/// Manages the 'schedule' sections of the app
class ScheduleCoursePageView extends StatefulWidget {

  ScheduleCoursePageView(
      {Key key,
        @required this.tabController,
        @required this.daysOfTheWeek,
        @required this.aggLectures,
        @required this.scheduleStatus,
        this.scrollViewController});

  final List<String> daysOfTheWeek;
  final List<List<Lecture>> aggLectures;
  final RequestStatus scheduleStatus;
  final TabController tabController;
  final ScrollController scrollViewController;

  @override
  ScheduleCoursePageViewState createState() =>
      ScheduleCoursePageViewState(tabController: tabController,
      daysOfTheWeek: daysOfTheWeek,
      aggLectures: aggLectures,
      scheduleStatus: scheduleStatus,scrollViewController: scrollViewController);

}

class ScheduleCoursePageViewState extends State<ScheduleCoursePageView>{

  ScheduleCoursePageViewState(
      {Key key,
        @required this.tabController,
        @required this.daysOfTheWeek,
        @required this.aggLectures,
        @required this.scheduleStatus,
        this.scrollViewController});

  final List<String> daysOfTheWeek;
  List<List<Lecture>> aggLectures;
  final RequestStatus scheduleStatus;
  final TabController tabController;
  final ScrollController scrollViewController;

  String Value_dropdown = "Todos";
  List<List<Lecture>> filtered_Lectures = List.empty(growable: true);
  List<String> filters = List.empty(growable: true);

@override
  Widget build(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);

    filters.add("Todos");

    for (int i = 0; i < daysOfTheWeek.length; i++) {
      List<Lecture> lectures_day = aggLectures[i];
      filtered_Lectures.add(List.empty(growable: true));
      for (Lecture lecture in lectures_day) {
        bool already_in = false;
        for (String a in filters) {
          if (a == lecture.classNumber) already_in = true;
        }
        if (!already_in) {
          filters.add(lecture.classNumber);
        }
        if(lecture.classNumber == Value_dropdown){
          filtered_Lectures[i].add(lecture);
        }

      }
    }
    List<List<Lecture>> saved_lectures = aggLectures;
    if(Value_dropdown != "Todos"){
      aggLectures = filtered_Lectures;
    }

    return Column(key: Key("horario_page_pickup"),children: <Widget>[
      Row(children: <Widget>[
        PageTitle(name: 'Horário'),
        Spacer(),
        DropdownButton<String>(
          value: Value_dropdown,
          icon: const Icon(Icons.arrow_drop_down),
          elevation: 16,
          style: const TextStyle(color: Colors.black),
          dropdownColor: Colors.white,
          underline: Container(
            height: 2,
            color: Colors.red,
          ),
          onChanged: (String newValue) {
            setState(() {
              aggLectures = saved_lectures;
              filtered_Lectures = List.empty(growable: true);
              filters = List.empty(growable: true);
              Value_dropdown = newValue;
            });
          },
          items: filters.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(color: Colors.black),
              ),
            );
          }).toList(),
        )]),
      ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          TabBar(
            controller: tabController,
            isScrollable: true,
            tabs: createTabs(queryData, context),
            indicatorColor: Colors.black,
            //labelColor: Colors.black,
          ),
        ],
      ),
      Expanded(
          child: TabBarView(
        controller: tabController,
        children: createSchedule(context),
      ))
    ]);
  }

  /// Returns a list of widgets empty with tabs for each day of the week.
  List<Widget> createTabs(queryData, BuildContext context) {
    final List<Widget> tabs = <Widget>[];
    for (var i = 0; i < daysOfTheWeek.length; i++) {
      tabs.add(Container(
        color: Colors.redAccent,
        width: queryData.size.width * 1 / 3,
        margin: EdgeInsets.symmetric(horizontal: 12.0),
        child: Tab(key: Key('schedule-page-tab-$i'), child: Text(daysOfTheWeek[i], style: TextStyle(color: Colors.black))),
      ));
    }
    return tabs;
  }

  List<Widget> createSchedule(context) {
    final List<Widget> tabBarViewContent = <Widget>[];
    for (int i = 0; i < daysOfTheWeek.length; i++) {
      tabBarViewContent.add(createScheduleByDay(context, i));
    }
    return tabBarViewContent;
  }

  /// Returns a list of widgets for the rows with a singular class info.
  List<Widget> createScheduleRows(lectures, BuildContext context) {
    final List<Widget> scheduleContent = <Widget>[];
    for (int i = 0; i < lectures.length; i++) {
      final Lecture lecture = lectures[i];
      scheduleContent.add(create_schedule_slot(
          lecture.subject,
          lecture.typeClass,
          lecture.room,
          lecture.startTime,
          lecture.endTime,
          lecture.teacher,
          lecture.classNumber));
    }
    return scheduleContent;
  }

  Widget create_schedule_slot(String subject, String typeClass, String room,
      String startTime, String endTime, String teacher, String classNumber) {
    return RowContainer(
        child: Container(
            padding: EdgeInsets.only(
                top: 10.0, bottom: 10.0, left: 22.0, right: 22.0),
            child: Row(children: [
              Text(
                classNumber + ":",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Column(children: [Text(startTime + "\n" + endTime)]),
              Spacer(),
              Column(children: [
                Text(subject + " " + "(" + typeClass + ")"),
                Text(teacher)
              ]),
              Spacer(),
              Column(children: [Text(room)])
            ])));
  }

  Widget Function(dynamic daycontent, BuildContext context) dayColumnBuilder(
      int day) {
    Widget createDayColumn(dayContent, BuildContext context) {
      return Container(
          key: Key('schedule-page-day-column-$day'),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: createScheduleRows(dayContent, context),
          ));
    }

    return createDayColumn;
  }

  Widget createScheduleByDay(BuildContext context, int day) {
    return RequestDependentWidgetBuilder(
      context: context,
      status: scheduleStatus,
      contentGenerator: dayColumnBuilder(day),
      content: aggLectures[day],
      contentChecker: aggLectures[day].isNotEmpty,
      onNullContent:
          Center(child: Text('Não possui aulas à ' + daysOfTheWeek[day] + '.')),
      index: day,
    );
  }

}

/*
class ScheduleCourseViewState extends UnnamedPickUPPageView {

}
  @override
  Widget getBody(BuildContext context) {
    List<Widget> c = <Widget>[];
    c.add(Text("Unidades Curriculares atuais:", style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold)));
    return ListView(children: <Widget>[Container(child: Column(mainAxisSize: MainAxisSize.max, children: c))]);
  }

*/
