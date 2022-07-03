class HomeController < ApplicationController
    #before_action :redirect_if_authenticated, only: [:guest_sign_in]
    def index
        @major_categories = MajorCategory.all #
        #redirect_to web_index_path
    end
    def guest_sign_in
        # @user = User.find_by(email: params[:user][:email].downcase)
        # if @user
        #     if @user.unconfirmed?
        #       redirect_to new_confirmation_path, alert: "Incorrect email or password."
        #     elsif @user.authenticate(params[:user][:password])
        #       sign_in @user
        #       redirect_to web_index_path, notice: "Signed in."
        #     else
        #       flash.now[:alert] = "Incorrect email or password."
        #       render :new, status: :unprocessable_entity
        #     end
        # else
        # flash.now[:alert] = "Incorrect email or password."
        # render :new, status: :unprocessable_entity
        # end
        user = User.new
        user.email = SecureRandom.alphanumeric(6) + "@email.com"
        user.password = SecureRandom.alphanumeric(6)
        user.save!
        sign_in user
        redirect_to web_index_path
    end
end
