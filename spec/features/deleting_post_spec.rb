require 'rails_helper.rb'

feature 'Deleting posts' do
  background do
    post = create(:post, caption: 'Whoops!')

    visit '/'
    find(:xpath, "//a[contains(@href, 'posts/1')]").click
    click_link 'Edit post'
  end

  scenario 'Can delete a single post' do
    click_button 'Delete Post'

    expect(page).to have_content('Problem solved! Post deleted.')
    expect(page).to_not have_content('Whoops!')
  end
end
