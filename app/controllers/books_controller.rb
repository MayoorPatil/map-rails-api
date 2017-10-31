# frozen_string_literal: true

class BooksController < ProtectedController
  before_action :set_book, only: %i[show update destroy]

  # GET /books - returns all books that belong to a child
  def index
    @books = current_user.kids.find(book_params[:kid_id]).books.all

    render json: @books
  end

  # GET /books/1
  def show
    render json: @book
  end

  # POST /books - create book that will belong to a child
  def create
    @book = current_user.kids.find(book_params[:kid_id]).books.build(book_params)

    if @book.save
      render json: @book, status: :created, location: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1 - update book that belongs with a child
  def update
    if @book.update(book_params)
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1 - delete book that belongs to a child
  def destroy
    @book.destroy
  end

  private

  # Set book that belongs to a child that is identified with kid_id
  def set_book
    @book = current_user.kids.find(book_params[:kid_id]).books.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def book_params
    params.require(:book).permit(:title, :author, :content, :image_url, :kid_id)
  end
end
