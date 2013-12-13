require 'spec_helper'

feature 'Subtypes' do
  scenario 'Managing Subtypes' do
    Given 'I am on the homepage'
    When 'I navigate to the Subtypes page'
    And 'I create a new subtype'
    Then 'I should see that new subtype on the index page'
    And 'I can see the details of the new subtype'
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
end

