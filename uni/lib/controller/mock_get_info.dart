import 'package:uni/model/entities/course_unit.dart';
import 'package:uni/model/entities/course.dart';

import '../model/entities/course_unit.dart';


CourseUnit esof = CourseUnit(id: 1,occurrId: 459481, abbreviation:"ESOF", name: "Engenharia de Software", curricularYear: 2021,ects: 6);
CourseUnit alge = CourseUnit(id: 2,occurrId: 459461, abbreviation:"ALGE", name: "Álgebra", curricularYear: 2021,ects: 4.5);
CourseUnit lc = CourseUnit(id: 3, occurrId: 459473, abbreviation:"LC", name: "Laboratório de Computadores", curricularYear: 2021,ects: 6);
CourseUnit so = CourseUnit(id: 4,occurrId: 484378, abbreviation:"SO", name: "Sistemas Operativos", curricularYear: 2021,ects: 6);
CourseUnit da = CourseUnit(id: 5,occurrId: 484424, abbreviation:"DA", name: "Desenho de Algoritmos", curricularYear: 2021,ects: 6);
CourseUnit ltw = CourseUnit(id: 6, occurrId: 484427, abbreviation:"LTW", name: "Linguagens e tecnologias web", curricularYear: 2021,ects: 6);


List<String> turmas_esof = ['2LEIC01', '2LEIC02', '2LEIC03', '2LEIC04', '2LEIC05', '2LEIC06'];
List<String> turmas_alge = ['1LEIC01', '1LEIC02', '1LEIC03', '1LEIC04', '1LEIC05', '1LEIC06','1LEIC07'];
List<String> turmas_lc = ['2LEIC01', '2LEIC02', '2LEIC03', '2LEIC04', '2LEIC05', '2LEIC06','2LEIC07','2LEIC08'];
List<String> turmas_so = ['2LEIC01', '2LEIC02', '2LEIC03', '2LEIC04', '2LEIC05', '2LEIC06','2LEIC07'];
List<String> turmas_da = ['2LEIC01', '2LEIC02', '2LEIC03', '2LEIC04', '2LEIC05', '2LEIC06'];
List<String> turmas_ltw = ['2LEIC01', '2LEIC02', '2LEIC03', '2LEIC04', '2LEIC05', '2LEIC06'];

double creditos_totais = 12;

Map<CourseUnit,String> enrolled_ucs = {esof : "-",lc : "-"}; //map uc inscrito para turma inscrito
List<CourseUnit> avaiable_ucs = [so,da,ltw,alge];



void increver_uc(CourseUnit new_uc){
    for(CourseUnit uc in avaiable_ucs){
      if(uc.id.compareTo(new_uc.id) == 0){
        avaiable_ucs.remove(uc);
        break;
      }
    }
    enrolled_ucs[new_uc] = "-";
    creditos_totais += new_uc.ects;
}

void desinscrever_uc(CourseUnit new_uc){
  for(CourseUnit uc in enrolled_ucs.keys){
    if(uc.id.compareTo(new_uc.id) == 0){
      enrolled_ucs.remove(uc);
      break;
    }
  }
  avaiable_ucs.add(new_uc);
  creditos_totais -= new_uc.ects;
}

List<CourseUnit> get_enrolled_ucs(){

  return enrolled_ucs.keys.toList();
}


List<CourseUnit> get_ucs(){
  List<CourseUnit> ucs =  [];

  ucs.add(esof);
  ucs.add(alge);
  ucs.add(lc);
  ucs.add(so);
  ucs.add(da);
  ucs.add(ltw);

  return ucs;
}


List<String> get_turmas_uc(CourseUnit uc){

  if(uc.id.compareTo(esof.id) == 0){ //ESOF
    return turmas_esof;
  }
  else  if(uc.id.compareTo(lc.id) == 0){ //ESOF
    return turmas_lc;
  }
  else  if(uc.id.compareTo(da.id) == 0){ //ESOF
    return turmas_da;
  }
  else  if(uc.id.compareTo(so.id) == 0){ //ESOF
    return turmas_so;
  }
  else  if(uc.id.compareTo(ltw.id) == 0){ //ESOF
    return turmas_ltw;
  }
  else if(uc.id.compareTo(alge.id) == 0){ //ESOF
    return turmas_alge;
  }
  return null;
}

String get_turma_uc(CourseUnit uc){


  return enrolled_ucs[uc];

}

void desincrever_turma_uc(CourseUnit uc){

  if(enrolled_ucs.containsKey(uc)){
    enrolled_ucs[uc] = "-";
  }

  return;
}

void set_turma_uc(CourseUnit uc, String turma){

  if(enrolled_ucs.containsKey(uc)){
    enrolled_ucs[uc] = turma;
  }

  return;
}
