require 'rails_helper'

feature 'user is looking for a book', %Q{
  as a user I want to find a book to get information on it
} do

  scenario 'user looks at list of books' do
    book1 = FactoryGirl.create(:book)
    book2 = FactoryGirl.create(:book)
    book3 = FactoryGirl.create(:book)

    visit '/'
    expect(page).to have_content book1.title
    expect(page).to have_content book2.author
    expect(page).to have_content book3.year
  end
end
