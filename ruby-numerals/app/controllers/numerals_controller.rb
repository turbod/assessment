class NumeralsController < ApplicationController

  # GET /numerals
  # GET /numerals.json
  def index
  end


  # POST /numerals
  # POST /numerals.json
  def transform
    @number = numeral_params[:number].to_i
    if @number.is_a? Integer
    else
      flash[:error] = 'The number is not an integer!'
      redirect_to root_path
      return
    end

    render :'numerals/show'
  end


  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def numeral_params
      params[:number]
    end
end
