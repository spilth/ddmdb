require 'spec_helper'

feature 'sizes' do
  scenario 'managing sizes' do
    Given 'I am on the homepage'
    When 'I navigate to the Sizes page'
    And 'I create a new size'
    Then 'I should see that new size on the index page'
    And 'I can see the details of the new size'
  end

  scenario 'viewing sizes' do
    Given 'I am on the homepage'
    And 'There is a size with miniatures'
    When 'I navigate to a size detail page'
    Then 'I should see the miniatures in that size'
  end

  def i_am_on_the_homepage
    visit root_path
  end

  def i_navigate_to_the_sizes_page
    click_on 'Sizes', match: :first
  end

  def i_create_a_new_size
    click_on 'New Size'
    fill_in 'Name', with: 'Medium'
    fill_in 'Abbreviation', with: 'M'
    click_on 'Create Size'
  end

  def i_should_see_that_new_size_on_the_index_page
    expect(page).to have_content 'Mediu'
  end

  def i_can_see_the_details_of_the_new_size
    click_on 'Medium'
    expect(page).to have_content 'Medium'
  end

  def there_is_a_size_with_miniatures
    size = create(:size, name: 'Medium')
    create(:miniature, name: 'Cleric of Order', size: size)
  end

  def i_navigate_to_a_size_detail_page
    click_on 'Sizes', match: :first
    click_on 'Medium'
  end

  def i_should_see_the_miniatures_in_that_size
    expect(page).to have_content 'Cleric of Order'
  end
end

