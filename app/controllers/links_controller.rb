class LinksController < ApplicationController
  def create
    @link = current_user.links.build(link_params)

    if @link.save
      flash[:success] = 'Your link has been added.'
      redirect_to stack_path(params[:stack_id])
    else
      flash[:error] = @link.errors.full_messages
      redirect_to stack_path(params[:stack_id])
    end
  end

  def destroy
    link = Link.find(params[:id])
    link.destroy
    flash[:success] = "Your link has been deleted."
    redirect_to stack_path(params[:stack_id])
  end

  private

  def link_params
    params.require(:link).permit(:url, :description, :stack_id)
  end
end
