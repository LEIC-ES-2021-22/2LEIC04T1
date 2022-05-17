
import '../../model/entities/course.dart';

List<Course> get_courses(){

  List<String> teachers = ["João Pascoal Faria", "Ademar Aguiar"];
  List<Course> courses =  [];
  courses.add(new Course(1,"Engenharia de Software","ESOF", "2022", 2021, "Active", ["João Pascoal Faria", "Ademar Aguiar"]));
  courses.add(new Course(1,"Engenharia de Software","ESOF", "2022", 2021, "Active", ["João Pascoal Faria", "Ademar Aguiar"]));
  courses.add(new Course(1,"Engenharia de Software","ESOF", "2022", 2021, "Active", ["João Pascoal Faria", "Ademar Aguiar"]));
  courses.add(new Course(1,"Engenharia de Software","ESOF", "2022", 2021, "Active", ["João Pascoal Faria", "Ademar Aguiar"]));


  return courses;
  }