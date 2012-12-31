require 'csv'
class UploadController < ApplicationController

  def index
  end

  def parse
    if params[:upload].nil?
      flash[:notice] = "Please enter a file"
      return redirect_to :action=>:index
    else
      file_data = params[:upload][:file].read
      csv_rows = CSV.parse(file_data, :headers=>true)
      csv_rows.headers().each do |header|
        if not %w(name UPC ingredients nutr_score econ_score gastro_score nutr_advice econ_advice gastro_advice).include? header
          flash[:notice] = "CSV not in right format"
          return redirect_to :action=>:index
        end
      end
      csv_rows.each do |row|
        Food.create!(row.to_hash)
      end
      flash[:notice] = "CSV successfully uploaded"
      return redirect_to :action=>:index
    end
  end
end
