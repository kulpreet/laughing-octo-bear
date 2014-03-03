module TodoMethods

  def index
    @todos = current_user.todos.order("priority asc, due_date asc")
    @todo = Todo.new
    respond_with @todos
  end

  def new
    @todo = Todo.new
    respond_with @todo
  end

  def show
    @todo = current_user.todos.where("todos.id" => params[:id]).first
    respond_with @todo
  end

  def create
    @todo = current_user.todos.build(params.require(:todo).permit(:description, :due_date, :priority))
    if @todo.save
      flash[:notice] = "Todo was created successfully."
      respond_with(@todo, :status => :created, :location => @todo) do |format|
        format.html { redirect_to todos_path }
      end
    else
      respond_with(@todo, :status => :unprocessable_entity) do |format|
        format.html { redirect_to todos_path, :flash => {error: @todo.errors.full_messages.join("</br>") } }
      end
    end
  end

  def edit
    @todo = current_user.todos.where("todos.id" => params[:id]).first
  end

  def update
    @todo = current_user.todos.where("todos.id" => params[:id]).first
    @todo.description = params[:todo][:description]
    @todo.priority = params[:todo][:priority]
    @todo.completed = params[:todo][:completed]
    date = DateTime.new(params[:todo]["due_date(1i)"].to_i, 
                        params[:todo]["due_date(2i)"].to_i, 
                        params[:todo]["due_date(3i)"].to_i,
                        params[:todo]["due_date(4i)"].to_i,
                        params[:todo]["due_date(5i)"].to_i)
    @todo.due_date = date

    if @todo.save
      flash[:notice] = "Todo was updated successfully."
      respond_with(@todo, :status => :updated, :location => @todo) do |format|
        format.html { redirect_to todos_path }
      end
    else
      respond_with(@todo.errors, :status => :unprocessable_entity) do |format|
        flash[:error] = @todo.errors.full_messages.join("</br>")
        format.html { render :action => :edit } 
      end
    end
  end

  def destroy
    @todo = current_user.todos.where("todos.id" => params[:id]).first    
    @todo.destroy
    redirect_to :action => :index
  end

end
