class MeshTypesController < ApplicationController
  before_action :set_mesh_type, only: [:show, :edit, :update, :destroy]

  # GET /mesh_types
  # GET /mesh_types.json
  def index
    @mesh_types = MeshType.all
  end

  # GET /mesh_types/1
  # GET /mesh_types/1.json
  def show
  end

  # GET /mesh_types/new
  def new
    @mesh_type = MeshType.new
  end

  # GET /mesh_types/1/edit
  def edit
  end

  # POST /mesh_types
  # POST /mesh_types.json
  def create
    @mesh_type = MeshType.new(mesh_type_params)

    respond_to do |format|
      if @mesh_type.save
        format.html { redirect_to @mesh_type, notice: 'Mesh type was successfully created.' }
        format.json { render :show, status: :created, location: @mesh_type }
      else
        format.html { render :new }
        format.json { render json: @mesh_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mesh_types/1
  # PATCH/PUT /mesh_types/1.json
  def update
    respond_to do |format|
      if @mesh_type.update(mesh_type_params)
        format.html { redirect_to @mesh_type, notice: 'Mesh type was successfully updated.' }
        format.json { render :show, status: :ok, location: @mesh_type }
      else
        format.html { render :edit }
        format.json { render json: @mesh_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mesh_types/1
  # DELETE /mesh_types/1.json
  def destroy
    @mesh_type.destroy
    respond_to do |format|
      format.html { redirect_to mesh_types_url, notice: 'Mesh type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mesh_type
      @mesh_type = MeshType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mesh_type_params
      params.require(:mesh_type).permit(:name, :label)
    end
end
