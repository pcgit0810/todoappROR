class RegistrationsController < ApplicationController

    def list
        @user = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        Rails.logger.info("PARAMS: #{params.inspect}")
        if @user.save
            session[:user_id] = @user.id
            redirect_to todo_list_index_path
            flash[:success] =  "Successfully created account"
        else
            render :new
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to user_list_path
        flash[:notice] =  "User deleted successfully"
    end
        
    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end