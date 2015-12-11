class Page < ActiveRecord::Base
    has_one :post
    has_one :tag
    has_many :code_files
end