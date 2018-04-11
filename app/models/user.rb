class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :wikis
  has_many :collaborations
  has_many :shared_wikis, through: :collaborations, source: :wiki

  enum role: [:standard, :premium, :admin]
  before_save { self.role ||= :standard }

  def downgrade!
    wikis.update_all(private: false)
    self.update_attribute(:role, 'standard')
    self.standard!
  end

end
