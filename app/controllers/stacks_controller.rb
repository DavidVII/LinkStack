class StacksController < ApplicationController
  before_filter :authenticate_user!

  def index
    @stacks = current_user.stacks.all
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

  def show
    @stack = Stack.find(params[:id])
  end

  private

  def stack_params
    params.require(:stack).permit(:name, :description)
  end
end
