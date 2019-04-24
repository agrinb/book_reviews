require 'rails_helper'

feature 'user creates a book', %Q{
  as a user I want to add a book and view it
} do

  scenario 'user submits book' do
    visit 'books/new'
    fill_in 'Title', with: 'Outliers'
    fill_in 'Author', with: 'Malcom Gladwell'
    fill_in 'Year', with: '2000'
    click_button 'Create Book'

    expect(page).to have_content 'Outliers'
    expect(page).to have_content 'Gladwell'
  end

  scenario 'user submits a duplicate book' do
    book = FactoryGirl.create(:book)

    visit 'books/new'
    fill_in 'Title', with: book.title
    fill_in 'Author', with: book.author
    fill_in 'Year', with: '2000'
    click_button 'Create Book'

    expect(page).to have_content 'Your book could not be saved.'
  end

  scenario 'user leaves out required field book' do
    visit 'books/new'
    fill_in 'Title', with: ''
    fill_in 'Author', with: 'Malcom Gladwell'
    fill_in 'Year', with: '2000'
    click_button 'Create Book'

    expect(page).to have_content 'Your book could not be saved.'
  end
end
