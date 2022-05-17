/// Stores information about a course.
/// 
/// The information stored is:
/// - Course `id`
/// - The `name` of the course
/// - Abbreviation of the `course`
/// - The course current `year`
/// - The date of the `firstEnrollment`
/// - The course `state`
class Course {
  int id;
  int festId;
  String name;
  String abbreviation;
  String currYear;
  int firstEnrollment;
  String state;

  List<String> regent_teachers;

  Course(int id, String name, String abbreviation, String currYear, int firstEnrollment, String state, List<String> regentTeachers) {
      this.id = id;
      this.festId = 1;
      this.name = name;
      this.abbreviation = abbreviation;
      this.currYear = currYear;
      this.firstEnrollment = firstEnrollment;
      this.state = state;
      this.regent_teachers = regentTeachers;
      }


  /// Creates a new instance from a JSON object.
  static Course fromJson(dynamic data) {
    return Course(
        data['cur_id'],
        data['cur_nome'],
        '',
        data['ano_curricular'],
        data['fest_a_lect_1_insc'],
        '',
        []
    );
  }

  /// Converts this course to a map.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fest_id': festId,
      'name': name,
      'abbreviation': abbreviation,
      'currYear': currYear,
      'firstEnrollment': firstEnrollment,
      'state': state
    };
  }
}
