class Post < ActiveRecord::Base

    # Relations
    has_many :comments

    include PageModule

end