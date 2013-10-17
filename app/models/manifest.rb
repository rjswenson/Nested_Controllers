class Manifest < ActiveRecord::Base

  has_many :checklists, :dependent => :destroy
end
