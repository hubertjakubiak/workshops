require 'spec_helper'

feature 'User checks student datebirth' do
  let!(:student) { create :student, first_name: 'Jan', last_name: 'Nowak', birthdate: '1997-08-01' }

  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit students_path
    find(:xpath, "//a[@title='show']").click
  end

  scenario do
      expect(page).to have_content '1997-08_01'
  end
end
