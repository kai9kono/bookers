class BooksController < ApplicationController
  def index
    @list = Book.new
    @lists = Book.all
    @findlist = Book.find_by(params[:id])
  end

  def show
    @list = Book.find(params[:id])
  end

  def create
    @list = Book.new(list_params)
    @lists = Book.all

    if @list.save
      redirect_to book_path(@list.id)
      flash[:notice] = "Book was successfully created."
    else
      render :index
    end
  end

  def edit
    @list = Book.find(params[:id])
  end

  def destroy
    list = Book.find(params[:id])
    list.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to '/books'
  end

  def update
    @list = Book.find(params[:id])
    if @list.update(list_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@list.id)
    else
      render :edit
    end
  end

  private
  def list_params
    params.require(:book).permit(:title, :body)
  end
end
