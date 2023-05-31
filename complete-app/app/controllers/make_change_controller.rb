class MakeChangeController < ApplicationController
  def index
    if defined? params[:amount]
      amount = params[:amount].to_d
      @nickels = (amount / 0.05).to_i
      @pennies = ((amount - 0.05*@nickels) / 0.01).to_i
    end
  end

end
