class Page < ActiveRecord::Base

    # Validations
    # -----------

    validates :heading, presence: {message: "The webpage heading cannot be blank."}

    # Relations
    # ---------

    has_one :post
    has_one :tag
    has_many :code_files
end