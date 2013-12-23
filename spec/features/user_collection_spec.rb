require 'spec_helper'

feature 'User Collection' do
  scenario 'Managing Miniatures' do
    Given 'I am logged in as a user'
    And 'There is a miniature'
    And 'I navigate to the Miniatures page'

    When 'I update the owned count of a miniature'
    And 'I update my collection'

    Then 'I should see the updated count for that miniature'
  end

  def i_am_logged_in_as_a_user
    user = create(:user)
    login user
    visit root_path
  end

  def there_is_a_miniature
    create(:miniature, name: 'Cleric of Order')
  end

  def i_navigate_to_the_miniatures_page
    click_link 'Miniatures'
  end

  def i_update_the_owned_count_of_a_miniature
    find_field('Cleric of Order Count').value.should eq '0'
    fill_in 'Cleric of Order Count', with: 42
  end

  def i_update_my_collection
    click_on 'Update Collection'
  end

  def i_should_see_the_updated_count_for_that_miniature
    find_field('Cleric of Order Count').value.should eq '42'
  end
end
