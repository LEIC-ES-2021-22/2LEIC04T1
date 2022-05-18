
import '../../model/entities/course.dart';

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