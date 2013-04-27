class Medicine < ActiveRecord::Base
 attr_accessible :name, :code_for_placing_order,:ordered_qty
 validates :name, :presence=>true
 validates :code_for_placing_order, :presence=>true
end
