class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :wikis

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  enum role: [:standard, :premium, :admin]
  before_save { self.role ||= :standard }
  after_initialize { self.role ||= :standard }

  def downgrade
    wikis.update_all(private: false)
  end

  # def downgrade
  #     @wikis = current_user.wikis
  #
  #     @wikis.unscoped.update_all(private: 'false')
  #     current_user.update_attribute(:role, 'standard')
  #
  #     flash[:notice] = "#{current_user.email} you're account has been downgraded"
  #     redirect_to edit_user_registration_path
  # end

end
