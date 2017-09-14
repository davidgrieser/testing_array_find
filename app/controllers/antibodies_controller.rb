class AntibodiesController < ApplicationController
  before_action :set_antibody, only: [:show, :edit, :update, :destroy]

  # GET /antibodies
  # GET /antibodies.json
  def index
    @antibodies = Antibody.all
  end

  # GET /antibodies/1
  # GET /antibodies/1.json
  def show
  end

  # GET /antibodies/new
  def new
    @antibody = Antibody.new
  end

  # GET /antibodies/1/edit
  def edit
  end

  # POST /antibodies
  # POST /antibodies.json
  def create
    @antibody = Antibody.new(antibody_params)

    respond_to do |format|
      if @antibody.save
        format.html { redirect_to @antibody, notice: 'Antibody was successfully created.' }
        format.json { render :show, status: :created, location: @antibody }
      else
        format.html { render :new }
        format.json { render json: @antibody.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /antibodies/1
  # PATCH/PUT /antibodies/1.json
  def update
    respond_to do |format|
      if @antibody.update(antibody_params)
        format.html { redirect_to @antibody, notice: 'Antibody was successfully updated.' }
        format.json { render :show, status: :ok, location: @antibody }
      else
        format.html { render :edit }
        format.json { render json: @antibody.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /antibodies/1
  # DELETE /antibodies/1.json
  def destroy
    @antibody.destroy
    respond_to do |format|
      format.html { redirect_to antibodies_url, notice: 'Antibody was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_antibody
      @antibody = Antibody.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def antibody_params
      params.require(:antibody).permit(:name, :amount, :panel_id)
    end
end
