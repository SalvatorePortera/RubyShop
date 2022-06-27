class HomeController < ApplicationController
    
    def guest_sign_in
        user = User.new
        user.email = SecureRandom.alphanumeric(6) + "@email.com"
        user.password = SecureRandom.alphanumeric(6)
        user.save!
        sign_in user
        redirect_to web_index_path
    end
    
end
