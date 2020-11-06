class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many : items
  # has_many : buys


  full_width = { with: /\A[ぁ-んァ-ンー-龥]+\z/ }
  full_width_kana = { with: /\A[ァ-ヶー－]+\z/ }

  with_options presence: true do
    validates :nickname
    validates :f_name, format: full_width
    validates :l_name, format: full_width
    validates :f_name_kana, format: full_width_kana
    validates :l_name_kana, format: full_width_kana
    validates :password, format: { with: /\A[a-zA-Z0-9]+\z/ }
    validates :email, uniqueness: true
    validates :birthday
  end
end
