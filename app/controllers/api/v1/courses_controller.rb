class Api::V1::CoursesController < Api::V1::BaseController

  # GET /courses with associated tutors
  def index
    pagy, courses = pagy(Course.includes(:tutors).all, page: params[:page], items: params[:per_page])
    render_json_with_pagination(pagy, courses, CourseSerializer)
  end

  # POST /courses along with tutor attributes
  def create
    course = Course.new(course_params)
    if course.save
      respond_with_success('Created', :created)
    else
      respond_with_error(course.errors.full_messages, :unprocessable_entity)
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def course_params
    params.fetch(:course, {})
          .permit(:title, :description, :price, :start_date, :end_date, :level, :category, :status,
                  tutors_attributes: [:name, :email])
  end
end