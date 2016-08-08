require 'spec_helper'

feature 'User edits payment' do
  let!(:student) { create :student, first_name: 'Jan', last_name: 'Abacki' }
  let!(:payment) { create :payment, student_id: student.id, amount: '1000.50', date: '01-02-2014' }

  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit payments_path
    expect(page).to have_content '1000.5'
    find(:xpath, "//a[@title='edit']").click
  end

  scenario 'and checks breadcrumbs presence' do
    within('.breadcrumbs') do
      expect(page).to have_content "RoR Workhops » Payments  » ID: #{payment.id}"
    end
  end

  scenario 'with valid input' do
    fill_in 'Amount', with: '2100.5'
    click_button 'Update Payment'
    expect(page).to have_content 'Payment has been updated!'
    expect(page).to have_content '2100.5'
  end

  scenario 'with invalid input' do
    fill_in 'Amount', with: ''
    click_button 'Update Payment'
    expect(page).to have_content "can't be blank"
  end

end
