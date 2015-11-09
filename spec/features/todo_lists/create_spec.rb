require 'spec_helper'

describe "Creating todo lists" do

	def create_todo_list(options={})
		options[:title] ||= "My todo list"
		options[:description] ||= "This is my todo list."
		
		visit "/todo_lists"
		click_link "New Todo list"
		expect(page).to have_content("New Todo List")

		fill_in "Title", with: options[:title]
		fill_in "Description", with: options[:description]
		click_button "Create Todo list"
	end

	it "redirects to the todo list index page on success" do
		create_todo_list
		expect(page).to have_content("My todo list")
	end

	it "displays an error when the todo list has no title" do 
		create_todo_list title: " "

		expect(TodoList.count).to eq(0)
		expect(page).to have_content("error")
	end

	it "displays an error when the todo list has no description" do 
		create_todo_list title: "Grocery list", description: ""

		expect(TodoList.count).to eq(0)
		expect(page).to have_content("error")
	end 

	it "displays an error when the todo list has a title less than 3 characters" do 
		create_todo_list title: "hi"

		expect(TodoList.count).to eq(0)
		expect(page).to have_content("error")
	end 
end