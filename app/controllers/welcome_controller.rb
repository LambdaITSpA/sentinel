class WelcomeController < ApplicationController
  def index
  end

  def alpha
  end

  def check_id
  	#it's ugly as fvck I know

  	#get vars
  	headers['Access-Control-Allow-Origin'] = '*'
	rut = params[:rut]
	serial = params[:serial]

	#query civil registry
  	registro_civil_url = "https://portal.sidiv.registrocivil.cl/docstatus?RUN=#{rut}&type=CEDULA&serial=#{serial}"
    doc = Nokogiri::HTML(open(registro_civil_url, {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE}))
    valid_chilean_id = doc.css('#tableResult > tbody > tr > td.setWidthOfSecondColumn').text == 'Vigente'
    
    #respond
    render json: { valid_chilean_id: valid_chilean_id }
  end
end