require 'spec_helper'

feature 'Subtypes' do
  scenario 'Managing Subtypes' do
    Given 'I am on the homepage'
    When 'I navigate to the Subtypes page'
    And 'I create a new subtype'
    Then 'I should see that new subtype on the index page'
    And 'I can see the details of the new subtype'
  end

  scenario 'viewing subtypes' do
    Given 'I am on the homepage'
    And 'There is a subtype with miniatures'
    When 'I navigate to a subtype detail page'
    Then 'I should see the miniatures in that subtype'
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
    release = Release.create(name: 'Harbinger', abbreviation: 'Ha', count: 80)
    subtype = Subtype.create(name: 'Human')
    Miniature.create(name: 'Cleric of Order', subtype: subtype, release: release, number: 1)
  end

  def i_navigate_to_a_subtype_detail_page
    click_on 'Subtypes', match: :first
    click_on 'Human'
  end

  def i_should_see_the_miniatures_in_that_subtype
    expect(page).to have_content 'Cleric of Order'
  end
end

