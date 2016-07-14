class Gist < ActiveRecord::Base
  has_many :contents
  has_many :comments
  
  accepts_nested_attributes_for :contents, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :comments, reject_if: :all_blank, allow_destroy: true
end
