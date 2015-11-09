class TodoList < ActiveRecord::Base
	validates :title, presence: true, length: { minimum : 3 }
	validates :description, presence: true
#	validates :description, length: { minimum : 5 }
end
