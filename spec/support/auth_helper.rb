require 'spec_helper'

module AuthHelper
 def login_user(buyer = nil)
   buyer = buyer || FactoryBot.create(:buyer)
   @request.env["devise.mapping"] = Devise.mappings[:buyer]
   sign_in buyer
 end

 def logout(buyer = nil)
   buyer = buyer || FactoryBot.create(:buyer)
   @request.env["devise.mapping"] = Devise.mappings[:buyer]
   sign_out buyer
 end
end
