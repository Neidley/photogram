feature 'Displaying posts' do
  scenario 'view all posts image and comments' do
    visit '/'
    expect(page).to have_content('#coffeetime')
    expect(page).to have_css("img[src*='coffee.jpg']")
  end
end
