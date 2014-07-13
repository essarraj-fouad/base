class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable and :omniauthable
  devise :confirmable,
         :database_authenticatable,
         :lockable,
         :recoverable,
         :registerable,
         :rememberable,
         :trackable,
         :validatable

  scope :admin,           ->{ where admin: true }
  scope :access_locked,   ->{ where 'locked_at IS NOT NULL AND locked_at >= ?', unlock_in.ago }
  scope :access_unlocked, ->{ where 'locked_at IS NULL OR locked_at < ?',       unlock_in.ago }

  def locked?
    access_locked? ? true : false
  end

  def unlocked?
    not locked?
  end

end
