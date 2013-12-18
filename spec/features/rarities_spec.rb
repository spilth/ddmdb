require 'spec_helper'

feature 'Rarities' do
  scenario 'Managing Rarities' do
    Given 'I am logged in as an admin'
    When 'I navigate to the Rarities page'
    And 'I create a new rarity'
    Then 'I should see that new rarity on the index page'
    And 'I can see the details of the new rarity'
  end

  scenario 'Viewing Rarities' do
    Given 'I am on the homepage'
    And 'There is a rarity with miniatures'

    When 'I navigate to the Rarities page'
    Then 'I should not see a create button'

    When 'I navigate to a rarity detail page'
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

  def i_navigate_to_the_rarities_page
    click_on 'Rarities', match: :first
  end

  def i_create_a_new_rarity
    click_on 'New Rarity'
    fill_in 'Name', with: 'Common'
    fill_in 'Abbreviation', with: 'C'
    click_on 'Create Rarity'
  end

  def i_should_see_that_new_rarity_on_the_index_page
    expect(page).to have_content 'Common'
  end

  def i_can_see_the_details_of_the_new_rarity
    click_on 'Common'
    expect(page).to have_content 'Common'
  end

  def there_is_a_rarity_with_miniatures
    rarity = create(:rarity, name: 'Common')
    create(:miniature, name: 'Cleric of Order', rarity: rarity)
  end

  def i_navigate_to_a_rarity_detail_page
    click_on 'Rarities', match: :first
    click_on 'Common'
  end

  def i_should_see_the_miniatures_in_that_rarity
    expect(page).to have_content 'Cleric of Order'
  end

  def i_should_not_see_a_create_button
    expect(page).to have_no_content 'New Rarity'
  end
end

