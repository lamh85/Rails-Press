class User < ActiveRecord::Base

    # Validations
    # -----------

    validates :password, length: {in: 6..20, message: "Your password must contain between 6 and 20 characters."}
    validates :email, format: { with: /[^@]*@[^@]*\.[^@]{2,4}/, message: "Your email is invalid." }

    # Relations
    # ---------

    has_many :posts
    has_many :comments
    
end
