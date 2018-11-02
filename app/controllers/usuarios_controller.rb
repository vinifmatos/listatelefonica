class UsuariosController < ApplicationController
  before_action :tem_acesso?
  before_action :set_usuario, only: [:edit, :update, :destroy]
  before_action :set_acessos, only: [:new, :edit, :create, :update]

  # GET /usuarios
  # GET /usuarios.json
  def index
    @usuarios = Usuario.all.order(:login).page(params[:page])
  end

  # GET /usuarios/new
  def new
    @usuario = Usuario.new
  end

  # GET /usuarios/1/edit
  def edit
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario = Usuario.new(usuario_params)

    respond_to do |format|
      if @usuario.save
        format.html { redirect_to usuarios_url, flash: { success: 'Usuario was successfully created.' } }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    limpa_senha! unless senha_alterada?
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to usuarios_url, flash: { success: 'Usuario was successfully updated.' } }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_url, flash: { success: 'Usuario was successfully destroyed.' } }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_usuario
    @usuario = Usuario.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def usuario_params
    params.require(:usuario).permit(:login, :email, :password, :password_confirmation, :acesso)
  end

  def set_acessos
    @acessos = Usuario.acessos
  end

  def tem_acesso?
    negar_acesso unless admin?
  end

  def senha_alterada?
    !params[:usuario][:password].blank? || !params[:usuario][:password_confirmation].blank?
  end

  def limpa_senha!
    params[:usuario].delete(:password)
    params[:usuario].delete(:password_confirmation)
  end
end
