require 'spec_helper'

feature 'Tagging' do
  scenario 'Tagging Miniatures' do
    Given 'I am logged in as a user'
    And   'There is a miniature'

    When 'I view the miniature'
    And  'I tag the miniature'

    Then 'I should see those tags on the miniature'
    And  'I should see that miniature on the page for that tag'

    When 'I view the list of tags'
    Then 'I should see the tag listed'
  end

  def i_am_logged_in_as_a_user
    user = create(:user)
    login user
    visit root_path
  end

  def there_is_a_miniature
    create(:miniature, name: 'Cleric of Order')
  end

  def i_view_the_miniature
    click_on 'Miniatures'
    click_on 'Cleric of Order'
  end

  def i_tag_the_miniature
    fill_in "Tags", with: 'beard'
    click_on 'Add Tags'
  end

  def i_should_see_those_tags_on_the_miniature
    expect(page).to have_content 'beard'
  end

  def i_should_see_that_miniature_on_the_page_for_that_tag
    click_on 'beard'
    expect(page).to have_content 'Cleric of Order'
  end

  def i_view_the_list_of_tags
    click_on 'Tags'
  end

  def i_should_see_the_tag_listed
    expect(page).to have_content 'beard'
  end
end

