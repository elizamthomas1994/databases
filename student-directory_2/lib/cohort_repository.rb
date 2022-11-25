class CohortRepository
  def find_with_students(id)
    sql = 'SELECT cohorts.id,
                  cohorts.name,
                  cohorts.genre,
                  students.id AS student_id,
                  students.title,
                  students.release_year
          FROM cohorts
          JOIN students ON students.cohort_id = cohorts.id
          WHERE cohorts.id = $1;'

    params = [id]

    result = DatabaseConnection.exec_params(sql, params)

    cohort = cohort.new

    cohort.id = result.first['id']
    cohort.name = result.first['name']
    cohort.genre = result.first['genre']

    result.each do |record|
      student = Student.new
      student.id = record['student_id']
      student.title = record['title']
      student.release_year = record['release_year']

      cohort.students << student
    end

    return cohort
  end
end
