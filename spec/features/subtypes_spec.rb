require 'spec_helper'

feature 'Subtypes' do
  scenario 'Managing Subtypes' do
    Given 'I am logged in as an admin'
    When 'I navigate to the Subtypes page'
    And 'I create a new subtype'
    Then 'I should see that new subtype on the index page'
    And 'I can see the details of the new subtype'
  end

  scenario 'Viewing Subtypes' do
    Given 'I am on the homepage'
    And 'There is a subtype with miniatures'

    When 'I navigate to the Subtypes page'
    Then 'I should not see a create button'

    When 'I navigate to a subtype detail page'
    Then 'I should see the miniatures in that subtype'
  end

  def i_am_logged_in_as_an_admin
    admin_user = create(:admin_user)
    login admin_user
    visit root_path
  end

  def i_am_on_the_homepage
    visit root_path
  end

  def i_navigate_to_the_subtypes_page
    click_on 'Subtypes', match: :first
  end

  def i_create_a_new_subtype
    click_on 'New Subtype'
    fill_in 'Name', with: 'Dwarf'
    click_on 'Create Subtype'
  end

  def i_should_see_that_new_subtype_on_the_index_page
    expect(page).to have_content 'Dwarf'
  end

  def i_can_see_the_details_of_the_new_subtype
    click_on 'Dwarf'
    expect(page).to have_content 'Dwarf'
  end

  def there_is_a_subtype_with_miniatures
    subtype = create(:subtype, name: 'Human')
    create(:miniature, name: 'Cleric of Order', subtype: subtype)
  end

  def i_navigate_to_a_subtype_detail_page
    click_on 'Subtypes', match: :first
    click_on 'Human'
  end

  def i_should_see_the_miniatures_in_that_subtype
    expect(page).to have_content 'Cleric of Order'
  end

  def i_should_not_see_a_create_button
    expect(page).to have_no_link 'New Subtype'
  end
end

