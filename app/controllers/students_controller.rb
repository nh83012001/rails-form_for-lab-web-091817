class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  # belongs_to :students

  # GET /students
  # GET /students.json
  def index
    @students = Student.all
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(params.require(:student))
    @student.save
    redirect_to student_path(@student)
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    @student = Student.find(params[:id])
    @student.update(params.require(:student))
    redirect_to student_path(@student)
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'School class was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:title, :room_number)
    end
end
