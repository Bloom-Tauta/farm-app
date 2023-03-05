class Farmer < ActiveRecord::Base
    has_many :farms
    has_many :vegetables
end