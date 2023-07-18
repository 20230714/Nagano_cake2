class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  # 会員フルネーム(しばじゅん）
  def full_name
    self.last_name + self.first_name
  end
  def kana_full_name
    self.kana_last_name + self.kana_first_name
  end
  
  def active_for_authentication?
    super && (is_deleted == false)
  end

  


end

 