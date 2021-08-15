class TodoListController < ApplicationController
    def index
        if Current.user.is_admin?
          @todo_list = Todolist.all
        else
             @todo_list = Todolist.find_by(user_id: Current.user.id)
               
        end
    end

    def show
        @todo_list = Todolist.find(params[:id])
    end

    def new
        @todo_list = Todolist.new
    end

    def create
        description = params[:todolist][:description]
        completed = params[:todolist][:completed]
        @todo_list = Todolist.new(user_id: Current.user.id, description: description, completed: completed)
        
        if @todo_list.save!
            redirect_to todo_list_index_path
            flash[:success] =  "Successfully created"
        else
            redirect_to todo_list_index_path
            flash[:alert] =  "Some error occured"
        end
    end

    def edit
        @todo_list = Todolist.find(params[:id])
    end

    def update
        @todo_list = Todolist.find(params[:id])

        user_id = @todo_list.user_id
        description = params[:todolist][:description]
        completed = params[:todolist][:completed]
    
        if @todo_list.update(user_id: user_id, description: description, completed: completed)
            redirect_to todo_list_index_path
            flash[:success] =  "Successfully updated"
        else
            render :edit
            flash[:alert] =  "Some error occured"
        end
    end

    def destroy
        @todo_list = Todolist.find(params[:id])
        @todo_list.destroy
        redirect_to todo_list_index_path
        flash[:notice] =  "Deleted"
    end
end

