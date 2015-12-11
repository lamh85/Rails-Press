class Page < ActiveRecord::Base
    has_one :post
    has_many :code_files
end