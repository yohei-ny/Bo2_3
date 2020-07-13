class Book < ApplicationRecord
	belongs_to :user
	validates :title, presence: true
	validates :body, presence: true
	validates :body, presence: true, length: { maximum: 200 }
	# def self.search(book_name)
	# #テンプレート、枠組み全体をみているItemという全体のItem=selfどちらでもいい
 #        if book_name
 #          Book.where(['title LIKE ?', "%#{book_name}%"])
 #          # Item.new
 #          # Item.find(1).price
 #        end
    
	
end
