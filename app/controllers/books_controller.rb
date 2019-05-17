class BooksController < ApplicationController
  
  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

	
  def index
	  if params[:title]
		  @books = Book.where('title LIKE ?', "%#{params[:title]}%")
	  else
		  @books = Book.all
	  end
  end  

  def show
    @book = Book.find(params[:id])
  end 

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)

    if @book.save
    redirect_to @book
    else
      render 'new'
    end  
  end

  def update
    @book = Book.find(params[:id])

      if @book.update(book_params)
        redirect_to @book
      else
        render 'edit'
      end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to books_path
  end

  private
    def book_params
      params.permit(:title, :text)
    end
end
