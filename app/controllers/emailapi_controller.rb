class EmailapiController < ApplicationController
  def subscribe
    gibbon = Gibbon::Request.new
    email = params[:email][:address]
    gibbon.lists("9af6f45b6a").members.create(body: {email_address: email, status: "pending"})
  end
end
