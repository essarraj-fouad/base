require 'spec_helper'

describe 'Users' do

  subject { page }

  let(:user) { FactoryGirl.create :user }

  describe 'sign up' do

    before do
      visit new_user_registration_path
    end

    it 'creates a new account' do
      # invalid data
      click_button 'Sign up'
      should have_content('prohibited this user from being saved')

      # valid data
      fill_in_fields 'user', email:                 'user@testing.com',
                             password:              'password',
                             password_confirmation: 'password'

      click_button 'Sign up'

      should have_content('A message with a confirmation link has been sent to your email address.')
    end

  end

  describe 'signing in' do

    it 'is linked to from the home page' do
      visit root_path
      should have_css("a[href='#{ new_user_session_path }']")
    end

    describe 'with email' do

      before do
        visit new_user_session_path
      end

      it 'can sign in' do
        # invalid data
        click_button 'Sign in'
        should have_content('Invalid email or password')

        # valid data
        fill_in_fields :user, email: user.email, password: 'password'
        click_button 'Sign in'
        should have_content('Signed in successfully')
      end

    end

  end

  describe 'signing out' do

    before do
      login_as user
    end

    it 'is linked to' do
      should have_css("a[href='#{ destroy_user_session_path }']")
    end

    it 'can sign out', :js do
      click_link user.email
      find_link('sign out').click
      should have_content('Signed out successfully')
    end

  end

end
