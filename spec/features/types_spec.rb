require 'spec_helper'

feature 'Types' do
  scenario 'Managing Types' do
    Given 'I am logged in as an admin'
    When 'I navigate to the Types page'
    And 'I create a new type'
    Then 'I should see that new type on the index page'
    And 'I can see the details of the new type'
  end

  scenario 'Viewing Types' do
    Given 'I am on the homepage'
    And 'There is a type with miniatures'

    When 'I navigate to the Types page'
    Then 'I should not see a create button'

    When 'I navigate to a type detail page'
    Then 'I should see the miniatures in that type'
  end

  def i_am_logged_in_as_an_admin
    admin_user = create(:admin_user)
    login admin_user
    visit root_path
  end

  def i_am_on_the_homepage
    visit root_path
  end

  def i_navigate_to_the_types_page
    click_on 'Types', match: :first
  end

  def i_create_a_new_type
    click_on 'New Type'
    fill_in 'Name', with: 'Aberration'
    click_on 'Create Type'
  end

  def i_should_see_that_new_type_on_the_index_page
    expect(page).to have_content 'Aberration'
  end

  def i_can_see_the_details_of_the_new_type
    click_on 'Aberration'
    expect(page).to have_content 'Aberration'
  end

  def there_is_a_type_with_miniatures
    type = create(:type, name: 'Humanoid')
    create(:miniature, name: 'Cleric of Order', type: type)
  end

  def i_navigate_to_a_type_detail_page
    click_on 'Types', match: :first
    click_on 'Humanoid'
  end

  def i_should_see_the_miniatures_in_that_type
    expect(page).to have_content 'Cleric of Order'
  end

  def i_should_not_see_a_create_button
    expect(page).to have_no_link 'New Type'
  end
end

