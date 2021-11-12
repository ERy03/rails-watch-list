class ListsController < ApplicationController
  # show all lists
  def index
    @lists = List.all
    @list = List.new
  end

  # def new
  #   @list = List.new
  # end

  def show
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      @lists = List.all
      render :index
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
