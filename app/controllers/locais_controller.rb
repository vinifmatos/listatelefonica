class LocaisController < ApplicationController
  before_action :set_local, only: [:show, :edit, :update, :destroy]

  # GET /locais
  # GET /locais.json
  def index
    @locais = Local.all.order(:nome).page(params[:page])
  end

  # GET /locais/1
  # GET /locais/1.json
  def show
  end

  # GET /locais/new
  def new
    @local = Local.new
    @local.build_endereco
  end

  # GET /locais/1/edit
  def edit
  end

  # POST /locais
  # POST /locais.json
  def create
    @local = Local.new(local_params)

    respond_to do |format|
      if @local.save
        format.html { redirect_to @local, flash: { success: 'Local was successfully created.' } }
        format.json { render :show, status: :created, location: @local }
      else
        format.html { render :new }
        format.json { render json: @local.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locais/1
  # PATCH/PUT /locais/1.json
  def update
    respond_to do |format|
      if @local.update(local_params)
        format.html { redirect_to @local, flash: { success: 'Local was successfully updated.' } }
        format.json { render :show, status: :ok, location: @local }
      else
        format.html { render :edit }
        format.json { render json: @local.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locais/1
  # DELETE /locais/1.json
  def destroy
    @local.destroy
    respond_to do |format|
      format.html { redirect_to locais_url, flash: { success: 'Local was successfully destroyed.' } }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_local
    @local = Local.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def local_params
    params.require(:local).permit(:nome, :telefone, endereco_attributes: [ :cep, :rua, :bairro, :cidade, :estado ])
  end
end
