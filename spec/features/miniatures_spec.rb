require 'spec_helper'

feature 'Miniatures' do
  background do
    create(:release, name: 'Harbinger', abbreviation: 'Ha', count: 80)
    create(:type, name: 'Humanoid')
    create(:subtype, name: 'Human')
    create(:size, name: 'Medium')
  end

  scenario 'Managing Miniatures' do
    Given 'I am logged in as an admin'
    When 'I navigate to the Miniatures page'
    And 'I create a new miniature'
    Then 'I should see that new miniature on the index page'
    And 'I can see the details of the new miniature'
  end

  scenario 'Viewing Miniatures' do
    Given 'I am on the homepage'
    And 'There is a miniature'

    When 'I navigate to the Miniatures page'
    Then 'I should not see a create button'

    When 'I navigate to a miniature detail page'
    Then 'I should see the miniatures in that rarity'
  end

  def i_am_logged_in_as_an_admin
    admin_user = create(:admin_user)
    login admin_user
    visit root_path
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
    select 'Medium', from: 'Size'
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

  def there_is_a_miniature
    create(:miniature, name: 'Cleric of Order')
  end

  def i_should_not_see_a_create_button
    expect(page).to have_no_content 'New Miniature'
  end

  def i_navigate_to_a_miniature_detail_page
    click_link 'Cleric of Order'
  end

  def i_should_see_the_miniatures_in_that_rarity
    expect(page).to have_content 'Miniature: Cleric of Order'
  end
end

