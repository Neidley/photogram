require 'rails_helper.rb'

feature 'Editing posts' do
  background do
    post = create(:post)

    visit '/'
    find(:xpath, "//a[contains(@href, 'posts/1')]").click
    click_link 'Edit post'
  end

  scenario 'Can edit a post' do
    fill_in 'Caption', with: 'Oh god, you were not meant to see this picture!'
    click_button 'Update Post'

    expect(page).to have_content('Post updated hombre')
    expect(page).to have_content('Oh god, you were not meant to see this picture!')
  end

  scenario 'will not update a post without an image' do
    attach_file('Image', 'spec/files/images/coffee.zip')
    click_button 'Update Post'

    expect(page).to have_content('Something went wrong. Try again.')
  end
end
