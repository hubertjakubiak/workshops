require 'spec_helper'

feature 'User creates payment' do

  let!(:student) { create :student, first_name: 'Jan', last_name: 'Nowak' }
  
  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit payments_path
    click_on 'Add New Payment'
  end

  scenario 'with valid input' do
    find('#payment_student_id').find(:xpath, 'option[2]').select_option
    fill_in 'Amount', with: 1050.99
    fill_in 'Date', with: '01.04.2016'
    fill_in 'Description', with: 'English lessons'
    click_button 'Create Payment'
    expect(page).to have_content 'Payment has been created!'
  end

  scenario 'with missing amount' do
    find('#payment_student_id').find(:xpath, 'option[2]').select_option
    fill_in 'Date', with: '01.04.2016'
    fill_in 'Description', with: 'English lessons'
    click_button 'Create Payment'
    expect(page).to have_content "can't be blank"
  end

  scenario 'with missing student' do
    fill_in 'Amount', with: 1050.99
    fill_in 'Description', with: 'English lessons'
    click_button 'Create Payment'
    expect(page).to have_content "can't be blank"
  end
end
