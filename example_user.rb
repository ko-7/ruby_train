# class User
#   attr_accessor :name, :email　#外部からクラスに渡す値を格納する変数

#   def initialize(attributes = {})　　#Uese.newすると自動で実行されるメソッド
#     @name  = attributes[:name]
#     @email = attributes[:email]
#   end

#   def formatted_email
#     "#{@name} <#{@email}>"
#   end

# end

class User
  attr_accessor :fname, :lname, :email

  def initialize(attributes = {})
    @fname  = attributes[:fname]
    @lname = attributes[:lname]
    @email = attributes[:email]
  end

  def formatted_email
    "名：#{@fname}　姓：#{@lname} email：<#{@email}>"
  end
end