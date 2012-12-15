class BadgeSet < ActiveRecord::Base
  include ActiveModel::Validations
  attr_accessible :name

  attr_accessible :source
  attr_accessor :source

  attr_accessible :image
  attr_accessor :image

  has_many :badges
  attr_accessor :badges

  validate :name_is_empty

  validates :name, :length => { :minimum => 2, :maximum => 50 }
  validates :name, presence: true, :if => "source.nil?"

  validates_format_of :image, :with => %r{\.(png|gif|jpg)$}i, :message => 'wrong extension of image', :allow_blank => true

  def name_is_empty
  	if source
  		source_filename = source.original_filename
  	else
  		source_filename = nil
  	end

  	if name.blank? and source_filename.blank?
  	  errors.add(:name, "can't be empty")
  	elsif name.blank?
  	  self.name = source_filename.gsub(/\.[^\.]*$/, '')
  	end

  	if source_filename.blank?
  		self.badges = nil
  	end
  end

end
