class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]

  # GET /projects or /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1 or /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
    @project.temperature ||= 36.0
    @project.pressure ||= 1
    @project.humidity ||= 40.0
    @project.sampleRate ||= 44100
    @project.irDuration ||= 3.0
    @project.maxReflections ||= 50
    @project.energyDecay ||= -60
    @project.numRays ||= 10000
    @project.clusterOrder ||= 3
    @project.diffuseProcessing ||= false
    @project.saveLateRays ||= false
    @project.artificialTail ||= true
    @project.saveDiffuseRays ||= false
    @project.auralization ||= false
    @project.autocad_file.attach(params[:autocad_file])
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects or /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: "Project was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: "Project was successfully updated." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:temperature, :pressure, :humidity, :sampleRate,
        :irDuration, :maxReflections, :energyDecay, :numRays, :clusterOrder, :diffuseProcessing,
        :saveLateRays, :artificialTail, :saveDiffuseRays, :auralization, :autocad_file)
    end
end
