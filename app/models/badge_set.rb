class BadgeSet < ActiveRecord::Base
  attr_accessible :name

  attr_accessible :source
  attr_accessor :source

  attr_accessible :image
  attr_accessor :image

  has_many :badges
  attr_accessor :badges
  
  validates :name, presence: true

  validates_format_of :image, :with => %r{\.(png|gif|jpg)$}i
end