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

  validates_format_of :image, :with => /.*\.(png|gif|jpg)/i, :message => 'wrong extension of image', :allow_blank => true

  def name_is_empty
  	if source
  		source_filename = source.original_filename
  	else
  		source_filename = nil
  	end

  	if image
  		image_filename = image.original_filename
  	else
  		image_filename = nil
  	end

  	puts "11111111111111111               #{image_filename}"

  	if name.blank? and source_filename.blank?
  	  errors.add(:name, "can't be empty")
  	elsif name.blank?
  	  self.name = source_filename.gsub(/\.[^\.]*$/, '')
  	end

  	if source_filename.blank?
  		self.badges = []
  	elsif source_filename.match(/\.(csv|txt)$/)
  		sourceData = source.read
  		sourceData.gsub!(/\r\n?/, "\n")
  		badges = [];
  		sourceData.each_line do |line|
  			badge_one = Badge.new()
  			badge_data = line.split("\t")
  			badge_one.name = badge_data[0]
  			badge_one.surname = badge_data[1]
  			badge_one.company = badge_data[2]
  			badge_one.profession = badge_data[3].gsub("\n", "")
  			badges.push(badge_one)
  		end
  		self.badges = badges
  		source.rewind()
  	else
  		self.badges = []
  	end
  end

end
