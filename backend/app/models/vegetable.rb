class Vegetable < ActiveRecord::Base
    belongs_to :farm
    belongs_to :farmer
end