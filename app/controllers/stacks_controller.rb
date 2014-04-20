class StacksController < ApplicationController
  before_filter :authenticate_user!
  before_action :get_stack, except: [ :new, :create, :index ]

  def index
    @stacks = current_user.stacks
  end

  def show
    @stack = Stack.find(params[:id])
  end

  def new
    @stack = Stack.new
  end

  def create
    @stack = current_user.stacks.build(stack_params)
    if @stack.save
      flash[:success] = "New stack created"
      redirect_to @stack
    else
      render 'new'
    end
  end

  def destroy
    Stack.find(params[:id]).destroy
    flash[:success] = 'Your stack has been deleted.'
    redirect_to stacks_path
  end

  private

  def get_stack
    @stack = Stack.find(params[:id])
    raise_404 unless @stack.user == current_user
    #raise_404 unless @stack.id.to_s == params[:id].to_s
  end

  def stack_params
    params.require(:stack).permit(:name, :description)
  end
end
