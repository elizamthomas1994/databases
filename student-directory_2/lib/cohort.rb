class Cohort
  attr_accessor :id, :cohort_name, :cohort_start_date, :students

  def initialize
    @students = []
  end
end