require 'spec_helper'

feature 'types' do
  scenario 'managing types' do
    Given 'I am on the homepage'
    When 'I navigate to the Types page'
    And 'I create a new type'
    Then 'I should see that new type on the index page'
  end

  def i_am_on_the_homepage
    visit root_path
  end

  def i_navigate_to_the_types_page
    click_on 'Types'
  end

  def i_create_a_new_type
    click_on 'New Type'
    fill_in 'Name', with: 'Aberration'
    click_on 'Create Type'
  end
end

