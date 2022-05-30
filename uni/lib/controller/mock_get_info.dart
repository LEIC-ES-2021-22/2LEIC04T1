
import 'package:uni/model/entities/course_unit.dart';
import 'package:uni/model/entities/course.dart';

List<CourseUnit> get_ucs(){

  List<String> teachers = ["João Pascoal Faria", "Ademar Aguiar"];
  List<CourseUnit> courses =  [];

  courses.add(new CourseUnit(occurrId: 459481, abbreviation:"ESOF", name: "Engenharia de Software", curricularYear: 2021,ects: 6));
  courses.add(new CourseUnit(occurrId: 459461, abbreviation:"ALGE", name: "Álgebra", curricularYear: 2021,ects: 4.5));
  courses.add(new CourseUnit(occurrId: 459473, abbreviation:"LC", name: "Laboratório de Computadores", curricularYear: 2021,ects: 6));
  courses.add(new CourseUnit(occurrId: 459481, abbreviation:"ESOF", name: "Engenharia de Software", curricularYear: 2021,ects: 6));
  courses.add(new CourseUnit(occurrId: 459461, abbreviation:"ALGE", name: "Álgebra", curricularYear: 2021,ects: 4.5));
  courses.add(new CourseUnit(occurrId: 459473, abbreviation:"LC", name: "Laboratório de Computadores", curricularYear: 2021,ects: 6));
  courses.add(new CourseUnit(occurrId: 459481, abbreviation:"ESOF", name: "Engenharia de Software", curricularYear: 2021,ects: 6));

  return courses;
  }


List<Course> get_courses(){

  List<String> teachers = ["João Pascoal Faria", "Ademar Aguiar"];
  List<Course> courses =  [];
  courses.add(new Course(459481,"Engenharia de Software","ESOF", "2020", 2021, "Active", ["João Pascoal Faria", "Ademar Aguiar"]));
  courses.add(new Course(1,"Laboratório de Computadores","LC", "2022", 2021, "Active", ["Pedro Souto", "Pedro Brandão"]));
  courses.add(new Course(1,"Álgebra","ALGE", "2022", 2021, "Active", ["António Ferreira"]));
  courses.add(new Course(1,"Álgebra","ALGE", "2022", 2021, "Active", ["António Ferreira"]));
  courses.add(new Course(1,"Álgebra","ALGE", "2022", 2021, "Active", ["António Ferreira"]));



  return courses;
}