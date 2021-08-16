class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(email: params[:email])
        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            flash[:success] = "Logged in successfully"
            if user.is_admin == true
                flash[:notice] = "Admin page"
            end
            redirect_to  todo_list_index_path 
        else
            flash[:alert] = "Invalid email or password"
            render :new
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path
        flash[:notice] = "Logged out"
    end
end