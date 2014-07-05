require 'rails_helper'

feature 'user wants to read reviews for a book', %Q{
  as a user I want to find a book review to know if it's good
} do

  scenario 'user successfully adds a review' do

    book1 = FactoryGirl.create(:book)
    visit(new_book_review_path(book1))
    fill_in 'Description', with: 'Awesome!'
    select('5', from: 'Rating')
    click_button "Create Review"


    expect(page).to have_content book1.title
    expect(page).to have_content "Awesome"
    expect(page).to have_content "5"
  end

  scenario 'user fails to leave a review' do

    book1 = FactoryGirl.create(:book)
    visit(new_book_review_path(book1))
    fill_in 'Description', with: ''
    select('5', from: 'Rating')
    click_button "Create Review"


    expect(page).to have_content "Sorry, your review could not be saved"
    expect(page).to have_content "New review"
  end


end
