class ListsController < ApplicationController
  before_action :set_list, only: %i[show create destroy]

  def index
    @list = List.new
    @lists = List.all
  end

  def create
    @lists = List.all
    @list = List.new(list_params)
    @list.save
    if @list.save
      redirect_to lists_path, notice: 'List was successfully created.'
    else
      render :lists, status: :unprocessable_entity
    end
  end

  def show
    @bookmark = Bookmark.new
  end

  def destroy
    @list.destroy
    redirect_to lists_path, status: :see_other
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
