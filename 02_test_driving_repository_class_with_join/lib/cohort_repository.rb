class CohortRepository
  def find_with_students(id)

    sql = 'SELECT cohorts.id AS cohort_id, cohorts.name AS cohort_name, cohorts.starting_date, students.id, students.name, students.cohort_id
              FROM cohorts
              JOIN students ON students.cohort_id = cohorts.id
              WHERE cohorts.id = $1;'

    params = [id]

    result = DatabaseConnection.exec_params(sql, params)

    students = Student.new

    students.id = result.first["id"]
    students.name = result.first["name"]
    students.starting_date = result.first["starting_date"]

    result.each do |record|
      cohort_find = Cohort.new
      cohort_find.id = record["id"]
      cohort_find.name = record["name"]
      cohort_find.starting_date = record["starting_date"]

     student.students << cohort_find
    end

    return students
  end
end
