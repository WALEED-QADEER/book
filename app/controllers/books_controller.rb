class BooksController < ApplicationController
  include Pagy::Backend
  load_and_authorize_resource
  
    def index
      # @books = Book.all
      @pagy, @books = pagy(Book.all, items:3)
      # @books = policy_scope(Book.all)
      # authorize @books
        if params[:search_by_bookname] && params[:search_by_bookname] != ""
        # @books = Book.where("title LIKE ?","#{params[:search_by_bookname]}%")
        @pagy, @books = pagy(Book.where("title LIKE ?","#{params[:search_by_bookname]}%"), items:3)
      end
    end
    def show
        @book = Book.find(params[:id])
        
    end
    def new
        @book = Book.new
        @book.authorbooks.build
          
       
      end
    
      def create
        @book = Book.new(book_params)
        
       
        if @book.save
          redirect_to @book
        else
          render :new, status: :unprocessable_entity
        end
      end
      def edit
        @book = Book.find(params[:id])
       

        
      end
    
      def update
        
        @book = Book.find(params[:id])
        
    
        if @book.update(book_params)
          redirect_to @book
        else
          render :edit, status: :unprocessable_entity
        end
      end
      def destroy
        @book = Book.find(params[:id])
        @book.destroy
    
        redirect_to books_path, status: :see_other
      end

     
      private
      def book_params
        params.require(:book).permit(:title, :content, :pages, authorbooks_attributes: [:id, :author_id, :_destroy])
      end
end
