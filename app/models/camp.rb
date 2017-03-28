class Camp < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  validates :name, presence: true

  has_one :address, :dependent => :destroy
  belongs_to :contact
  belongs_to :site_setup
  has_many :images, :dependent => :destroy
  has_many :camp_infos

  accepts_nested_attributes_for :images, :address
end
