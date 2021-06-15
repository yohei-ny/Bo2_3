class SearchsController < ApplicationController
	def index
	if params[:search].present?
		if params[:model] == "user"
			if params[:how] == "1"
			 	@users =User.where("name LIKE ?", "#{params[:search]}%")
			elsif params[:how] == "2"
			 	@users =User.where("name LIKE ?", "%#{params[:search]}")
			elsif params[:how] == "0"
				@users =User.where("name LIKE ?", "#{params[:search]}")
			else
				@users = User.where(['name LIKE ?', "%#{params[:search]}%"])
			end
		else params[:model] == "book"
			if params[:how] == "1"
				@books =Book.where("title LIKE ?", "#{params[:search]}%")
			elsif params[:how] == "2"
				@books =Book.where("title LIKE ?", "%#{params[:search]}")
			elsif params[:how] == "0"
				# binding.pry
			list = []
  				Book.all.each do |book|
    				book_all = book.title + book.body
    				if book_all == params[:search]
     					list.push book.id
					end
				end
			@books = Book.where(id: list)
				# @books =Book.where("#{title} #{body}","#{params[:search]}")
				# User.where(first_name: "Nxck").minimum(:salary)
			else
				@books = Book.where(['title LIKE ?', "%#{params[:search]}%"])
			end
		# @books = Book.search(params[:search])
	    # @books = Book.where(['title LIKE ?', "%#{book_name}%"])
	 	# @books = Book.where(['title LIKE ?', "%#{params[:search]}%"])
		end
	end
end
end
