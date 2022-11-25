require 'cohort_repository'

def reset_cohorts_table
  seed_sql = File.read("spec/seeds_student_directory.sql")
  connection = PG.connect({ host: "127.0.0.1", dbname: "student_directory_2" })
  connection.exec(seed_sql)
end

describe CohortRepository do
  before(:each) do
    reset_cohorts_table
  end

  it "finds cohort and its students " do
    repo = CohortRepository.new
    cohort = repo.find_with_students(1)
    expect(cohort.cohort_name).to eq("R")
    expect(cohort.students.length).to eq(2)
    expect(cohort.students.first.student_name).to eq ("Toby")
    expect(cohort.cohort_start_date).to eq("2022,01,01")
  end
end
