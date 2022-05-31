
import 'package:uni/model/entities/course_unit.dart';
import 'package:uni/model/entities/course.dart';

import '../model/entities/course_unit.dart';


CourseUnit esof = CourseUnit(id: 1,occurrId: 459481, abbreviation:"ESOF", name: "Engenharia de Software", curricularYear: 2021,ects: 6);
CourseUnit alge = CourseUnit(id: 2,occurrId: 459461, abbreviation:"ALGE", name: "Álgebra", curricularYear: 2021,ects: 4.5);
CourseUnit lc = CourseUnit(id: 3, occurrId: 459473, abbreviation:"LC", name: "Laboratório de Computadores", curricularYear: 2021,ects: 6);

String turma_esof = "-";
String turma_alge = "-";
String turma_lc = "-";

List<String> turmas_esof = ['2LEIC01', '2LEIC02', '2LEIC03', '2LEIC04', '2LEIC05', '2LEIC06'];
List<String> turmas_alge = ['1LEIC01', '1LEIC02', '1LEIC03', '1LEIC04', '1LEIC05', '1LEIC06','1LEIC07'];
List<String> turmas_lc = ['2LEIC01', '2LEIC02', '2LEIC03', '2LEIC04', '2LEIC05', '2LEIC06'];



List<CourseUnit> get_ucs(){
  List<CourseUnit> courses =  [];

  courses.add(esof);
  courses.add(alge);
  courses.add(lc);
  courses.add(esof);
  courses.add(alge);
  courses.add(lc);
  courses.add(esof);

  return courses;
  }


List<String> get_turmas_uc(CourseUnit uc){

  if(uc.id.compareTo(esof.id) == 0){ //ESOF
      return turmas_esof;
  }
  else  if(uc.id.compareTo(lc.id) == 0){ //ESOF
    return turmas_lc;
  }
  if(uc.id.compareTo(alge.id) == 0){ //ESOF
    return turmas_alge;
  }
  return null;
}

String get_turma_uc(CourseUnit uc){

  if(uc.id.compareTo(esof.id) == 0){ //ESOF
    return turma_esof;
  }
  else  if(uc.id.compareTo(lc.id) == 0){ //LC
    return turma_lc;
  }
  else if(uc.id.compareTo(alge.id) == 0){ //ALGE
    return turma_alge;
  }
  return null;
}


void set_turma_uc(CourseUnit uc, String turma){

  if(uc.id.compareTo(esof.id) == 0){ //ESOF
    turma_esof = turma;
  }
  else if(uc.id.compareTo(lc.id) == 0){ //ESOF
    turma_lc = turma;
  }
  else if(uc.id.compareTo(alge.id) == 0){ //ESOF
    turma_alge = turma;
  }
  return;
}