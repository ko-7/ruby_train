class User < ApplicationRecord
  has_secure_password

  # validates(:name, presence: true)
  validates :name, 
    presence: true,           #入力必須
    length: { maximum: 50 }   #50文字以内にするバリデーション


  before_save { self.email = self.email.downcase }
  # ↑の書き換え：before_save { email.downcase! }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, 
    presence: true, 
    length: { maximum: 255 }, 
    format: { with: VALID_EMAIL_REGEX }, 
    uniqueness: { case_sensitive: false }

  validates :password, 
    presence: true,
    length: { minimum: 6 }

  # 渡された文字列のハッシュ値を返す
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

end
