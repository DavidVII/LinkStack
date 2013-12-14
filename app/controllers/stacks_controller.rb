class StacksController < ApplicationController
  before_filter :authenticate_user!

  def index
    @stacks = current_user.stacks
  end

  def show
    @stack = Stack.find(params[:id])
    @link = Link.new
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

  def stack_params
    params.require(:stack).permit(:name, :description)
  end
end
