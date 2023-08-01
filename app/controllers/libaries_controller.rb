class LibariesController < ApplicationController
    def index
      
        @librarys = Library.all
        

        if params[:search_by_libraryname] && params[:search_by_libraryname] != ""
            @librarys = library.where("name LIKE ?","#{params[:search_by_libraryname]}%")
          end
    end
    def show
        @library = Library.find(params[:id])
    end
    def new
        @library = Library.new
      end
    
      def create
        @library = Library.new(library_params)
    
        if @library.save
          redirect_to @library
        else
          render :new, status: :unprocessable_entity
        end
      end
      def edit
        @library = Library.find(params[:id])
      end
    
      def update
        @library = Library.find(params[:id])
    
        if @library.update(library_params)
          redirect_to @library
        else
          render :edit, status: :unprocessable_entity
        end
      end
      def destroy
        @library = Library.find(params[:id])
        @library.destroy
    
        redirect_to librarys_path, status: :see_other
      end

     
      private
      def library_params
        params.require(:library).permit(:name)
      end
end
