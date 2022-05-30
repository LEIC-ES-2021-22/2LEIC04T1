import 'package:tuple/tuple.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/lecture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/view/Pages/schedule_course_page_view.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/view/Pages/unnamed_pickup_page_view.dart';
import 'package:uni/view/Pages/general_page_view.dart';

class ScheduleCoursePage extends StatefulWidget {
  const ScheduleCoursePage({Key key}) : super(key: key);

  @override
  _ScheduleCoursePageState createState() => _ScheduleCoursePageState();
}

class _ScheduleCoursePageState extends UnnamedPickUPPageView
    with SingleTickerProviderStateMixin{
  final int weekDay = DateTime.now().weekday;

  TabController tabController;
  ScrollController scrollViewController;

  final List<String> daysOfTheWeek = [
    'Segunda-feira',
    'Terça-feira',
    'Quarta-feira',
    'Quinta-feira',
    'Sexta-feira'
  ];

  List<List<Lecture>> _groupLecturesByDay(schedule) {
    final aggLectures = <List<Lecture>>[];

    for (int i = 0; i < daysOfTheWeek.length; i++) {
      final List<Lecture> lectures = <Lecture>[];
      for (int j = 0; j < schedule.length; j++) {
        if (schedule[j].day == i) lectures.add(schedule[j]);
      }
      aggLectures.add(lectures);
    }
    return aggLectures;
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: daysOfTheWeek.length);
    final offset = (weekDay > 5) ? 0 : (weekDay - 1) % daysOfTheWeek.length;
    tabController.animateTo((tabController.index + offset));
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget getBody(BuildContext context) {

    return StoreConnector<AppState, Tuple2<List<Lecture>, RequestStatus>>(
      converter: (store) => Tuple2(store.state.content['courseschedule'],
          store.state.content['coursescheduleStatus']),
      builder: (context, lectureData) {
        final lectures = lectureData.item1;
        final scheduleStatus = lectureData.item2;
        return ScheduleCoursePageView(
                tabController: tabController,
                scrollViewController: scrollViewController,
                daysOfTheWeek: daysOfTheWeek,
                aggLectures: _groupLecturesByDay(lectures),
                scheduleStatus: scheduleStatus);
      },
    );
  }


}
