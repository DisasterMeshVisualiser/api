class MeshCodesController < ApplicationController
  before_action :set_mesh_code, only: [:show, :edit, :update, :destroy]

  # GET /mesh_codes
  # GET /mesh_codes.json
  def index
    @mesh_codes = MeshCode.all
  end

  # GET /mesh_codes/1
  # GET /mesh_codes/1.json
  def show
  end

  # GET /mesh_codes/new
  def new
    @mesh_code = MeshCode.new
  end

  # GET /mesh_codes/1/edit
  def edit
  end

  # POST /mesh_codes
  # POST /mesh_codes.json
  def create
    @mesh_code = MeshCode.new(mesh_code_params)

    respond_to do |format|
      if @mesh_code.save
        format.html { redirect_to @mesh_code, notice: 'Mesh code was successfully created.' }
        format.json { render :show, status: :created, location: @mesh_code }
      else
        format.html { render :new }
        format.json { render json: @mesh_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mesh_codes/1
  # PATCH/PUT /mesh_codes/1.json
  def update
    respond_to do |format|
      if @mesh_code.update(mesh_code_params)
        format.html { redirect_to @mesh_code, notice: 'Mesh code was successfully updated.' }
        format.json { render :show, status: :ok, location: @mesh_code }
      else
        format.html { render :edit }
        format.json { render json: @mesh_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mesh_codes/1
  # DELETE /mesh_codes/1.json
  def destroy
    @mesh_code.destroy
    respond_to do |format|
      format.html { redirect_to mesh_codes_url, notice: 'Mesh code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mesh_code
      @mesh_code = MeshCode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mesh_code_params
      params.require(:mesh_code).permit(:value, :rank)
    end
end
