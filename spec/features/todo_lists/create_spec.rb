require 'spec_helper'

describe "Creating todo lists" do
	it "redirects to the todo list index page on success" do
		visit "/todo_lists"
		click_link "New Todo list"
		expect(page).to have_content("New Todo List")

		fill_in "Title", with: "My Todo List"
		fill_in "Description", with: "this is what I'm doing today."
		click_button "Create Todo list"

		expect(page).to have_content("My Todo List")
	end

	it "displays an error when the todo list has no title" do 
		visit "/todo_lists"
		click_link "New Todo list"

		fill_in "Title", with: " "
		fill_in "Description", with: "this is what I'm doing today."
		click_button "Create Todo list"

		expect(TodoList.count).to eq(0)
		expect(page).to have_content("error")
	end 

	it "displays an error when the todo list has a title less than 3 characters" do 
		visit "/todo_lists"
		click_link "New Todo list"

		fill_in "Title", with: "hi"
		fill_in "Description", with: "this is what I'm doing today."
		click_button "Create Todo list"

		expect(TodoList.count).to eq(0)
		expect(page).to have_content("error")
	end 
end