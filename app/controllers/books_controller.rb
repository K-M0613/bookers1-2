class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.valid?
      @book.save
      flash[:success] = "投稿しました"
      redirect_to book_path(@book)
    else
      @books = Book.all
      render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.valid?
      @book.update(book_params)
      flash[:success] = "更新しました"
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:success] = "削除しました"
      redirect_to books_path
    else
      render :show
    end
  end

  private

  def book_params
    params.permit(:title, :body)
  end

end
