require 'spec_helper'

feature 'miniatures' do
  background do
    Release.create(name: 'Harbinger', abbreviation: 'Ha', count: 80)
    Type.create(name: 'Humanoid')
    Subtype.create(name: 'Human')
  end

  scenario 'managing miniatures' do
    Given 'I am on the homepage'
    When 'I navigate to the Miniatures page'
    And 'I create a new miniature'
    Then 'I should see that new miniature on the index page'
    And 'I can see the details of the new miniature'
  end

  def i_am_on_the_homepage
    visit root_path
  end

  def i_navigate_to_the_miniatures_page
    click_on 'Miniatures', match: :first
  end

  def i_create_a_new_miniature
    click_on 'New Miniature'
    fill_in 'Name', with: 'Cleric of Order'
    select 'Harbinger', from: 'Release'
    fill_in 'Number', with: '1'
    select 'Humanoid', from: 'Type'
    select 'Human', from: 'Subtype'
    click_on 'Create Miniature'
  end

  def i_should_see_that_new_miniature_on_the_index_page
    expect(page).to have_content 'Cleric of Order'
  end

  def i_can_see_the_details_of_the_new_miniature
    click_on 'Cleric of Order'
    expect(page).to have_content 'Miniature: Cleric of Order'
    expect(page).to have_content 'Release Harbinger'
    expect(page).to have_content 'Number 1'
    expect(page).to have_content 'Type Humanoid'
    expect(page).to have_content 'Subtype Human'
  end
end

