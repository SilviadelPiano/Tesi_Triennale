class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :configure_devise_permitted_parameters, if: :devise_controller?
  before_action :google_set_up

  #after_action :pass_params, if: :devise_controller?

  def google_set_up
    require 'google/apis/drive_v2'

    scopes = 'https://www.googleapis.com/auth/drive'
    authorization = Google::Auth.get_application_default(scopes)
    #Drive = Google::Apis::DriveV2 # Alias the module
    @drive = Google::Apis::DriveV2::DriveService.new
    @drive.authorization = authorization
  end

  def d_file
    file_id = params[:file_id]
    @file_name = params[:file_name]
    @drive.get_file(file_id, download_dest: '/home/biar/Downloads/'+@file_name)
  end

  protected

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || dashboard_path
  end

  def configure_devise_permitted_parameters
    registration_params = [ :name, :surname, :CF, :sex, :birth_place, :birth_date, :email, :password, roles:[] ] 

    if params[:action] == 'create'
      devise_parameter_sanitizer.permit(:sign_up) {
        |u| u.permit(registration_params)
      }
    end
  end

  #def pass_params
   # @codice_fiscale = params[:CF]
    #@ruolo = params[:roles_mask]
  #end

end
