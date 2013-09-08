require 'spec_helper'

describe 'Managing Users' do

  subject { page }

  let(:admin) { FactoryGirl.create :admin }
  let(:user)  { FactoryGirl.create :user }

  describe 'listing' do

    let(:path) { rails_admin.index_path :user }

    describe 'permissions' do

      it { should_not allow_access.to :guest }
      it { should_not allow_access.to :user }
      it { should     allow_access.to :admin }

    end

    context 'when allowed' do

      let(:other_users) { User.where 'id != ?', admin.id }

      before do
        FactoryGirl.create_list :user, 3
        login_as admin
        visit path
      end

      it { should have_css "a[href='#{ rails_admin.new_path :user }']" }

      it 'links to edit each user' do
        User.all.map do |user|
          should have_css "a[href='#{ rails_admin.edit_path :user, user }']"
        end
      end

      it 'links to delete each user' do
        other_users.all.map do |user|
          should have_css "a[href='#{ rails_admin.delete_path :user, user }']"
        end
      end

      context 'unlocked accounts' do

        before do
          other_users.last.lock_access!
          visit path
        end

        it 'does not link to lock the current user' do
          should_not have_css "a[href='#{ rails_admin.lock_user_path :user, admin }']"
        end

        it 'does not link to unlock each user' do
          User.access_unlocked.map do |user|
            should_not have_css "a[href='#{ rails_admin.unlock_user_path :user, user }']"
          end
        end

        it 'links to lock each user' do
          other_users.access_unlocked.map do |user|
            should have_css "a[href='#{ rails_admin.lock_user_path :user, user }']"
          end
        end

      end

      context 'locked accounts' do

        before do
          other_users.last.lock_access!
          visit path
        end

        it 'does not link to lock each user' do
          User.access_locked.map do |user|
            should_not have_css "a[href='#{ rails_admin.lock_user_path :user, user }']"
          end
        end

        it 'links to unlock each user' do
          User.access_locked.map do |user|
            should have_css "a[href='#{ rails_admin.unlock_user_path :user, user }']"
          end
        end

      end

    end

  end

  describe 'creating' do

    let(:path) { rails_admin.new_path :user }

    describe 'permissions' do

      it { should_not allow_access.to :guest }
      it { should_not allow_access.to :user }
      it { should     allow_access.to :admin }

    end

    context 'when allowed' do

      before do
        login_as admin
        visit path
      end

      it 'creates a new user' do
        # invalid data
        click_button 'Save'
        should have_content('User failed to be created')

        # valid data
        fill_in_fields :user, email: 'picard@enterprise.com', password: 'password'

        check 'Admin'

        click_button 'Save'
        should have_content('User successfully created')
      end

    end

  end

  describe 'editing' do

    let(:path) { rails_admin.edit_path :user, user }

    describe 'permissions' do

      it { should_not allow_access.to :guest }
      it { should_not allow_access.to :user }
      it { should     allow_access.to :admin }

    end

    context 'when allowed' do

      before do
        login_as admin
        visit path
      end

      it 'updates the user' do
        # invalid data
        fill_in_fields :user, email: ''

        click_button 'Save'
        should have_content('User failed to be updated')

        # valid data
        fill_in_fields :user, email: user.email, password: 'drowssap'

        check 'Admin'

        click_button 'Save'
        should have_content('User successfully updated')
      end

    end

  end

  describe 'destroying' do

    let(:path) { rails_admin.index_path :user }

    before do
      user
      login_as admin
      visit path
    end

    it 'prompts for confirmation', :js do
      find("a[href='#{ rails_admin.delete_path :user, user }']").click
      should have_content('Are you sure you want to delete this user')
    end

    it 'displays a confirmation' do
      visit rails_admin.delete_path :user, user
      click_button "Yes, I'm sure"
      should have_content('User successfully deleted')
    end

    it 'deletes the user' do
      visit rails_admin.delete_path :user, user
      click_button "Yes, I'm sure"

      ->{ user.reload }.should raise_exception ActiveRecord::RecordNotFound
    end

  end

end
