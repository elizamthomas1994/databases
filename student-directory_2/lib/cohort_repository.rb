require 'cohort'
require 'student'

class CohortRepository
  def find_with_students(id)
    sql = 'SELECT cohorts.id, 
                  cohorts.cohort_name, 
                  cohorts.cohort_start_date,
                  students.id AS student_id, 
                  students.student_name, 
                  students.cohort_id
              FROM cohorts
              JOIN students ON students.cohort_id = cohorts.id
              WHERE cohorts.id = $1;'

    params = [id]

    result = DatabaseConnection.exec_params(sql, params)

    cohorts = Cohort.new
    cohorts.id = result.first["id"]
    cohorts.cohort_name = result.first["cohort_name"]
    cohorts.cohort_start_date = result.first["cohort_start_date"]

    result.each do |record|
      student = Student.new
      student.id = record["id"]
      student.student_name = record["student_name"]
      student.cohort_id = record["cohort_id"]

      cohorts.students << student
    end

    return cohorts
  end
end
