class BooksController < ApplicationController
  
  def index
    @books = Book.all
  end
  
  def new
    @book = Book.new
  end
  
  def show
    @book = Book.find(params[:id])
  end
  
  def create
    @book = Book.new(params[:book])
    if @book.save
      redirect_to books_path, :notice => "Book created succesfully"
    else
      flash[:alert] = "Failed to create book"
      render :action => 'new'
    end
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    
    if @book.update_attributes(params[:book])
      redirect_to books_path, :notice => "Book Updated Succesfully"
    else
      flash[:alert] = "Failed to Update Book"
      render :action => 'edit'
    end
  end
  
  def destroy
    #todo write destroy stuff
  end
end