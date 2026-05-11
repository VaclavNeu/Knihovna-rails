class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]
    def index
      @books = Book.all
    end

    def show
    end

    def new
      @book = Book.new
    end

    def create
      @book = Book.new(book_params)
      if @book.save
        redirect_to book_path(@book), notice: "Kniha byla úspěšně přidána."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @book.update(book_params)
        redirect_to book_path(@book), notice: "Kniha byla úspěšně aktualizována."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      if @book.deletable?
        @book.destroy
        redirect_to books_path, notice: "Kniha byla úspěšně smazána."
      else
        redirect_to books_path, alert: "Kniha nelze smazat, protože je momentálně vypůjčena."
      end
    end

    private

    def book_params
      params.require(:book).permit(:title, :author, :description, :isbn, :quantity)
    end
    def set_book
      @book = Book.find(params[:id])
    end
end
