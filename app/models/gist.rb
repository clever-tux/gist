class Gist < ActiveRecord::Base
  has_many :contents, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user
  
  accepts_nested_attributes_for :contents, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :comments, reject_if: :all_blank, allow_destroy: true
end
