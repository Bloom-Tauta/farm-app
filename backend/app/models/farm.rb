class Farm < ActiveRecord::Base
    has_many :vegetables
    belongs_to :farmer
end