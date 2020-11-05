class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many : items
  # has_many : buys

  validates :nickname, presence: true
  validates :f_name, presence: true, format: {with: /\A[ぁ-んァ-ンー-龥]+\z/}
  validates :l_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]+\z/}
  validates :f_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :l_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :birthday, presence: true
  validates :password, format: {with: /\A[a-zA-Z0-9]+\z/}
  # validates :email, presence: true, uniqueness: true
end
