class Post < ActiveRecord::Base
  searchkick 
  acts_as_votable

  # def search_data
  #   attributes.merge Post.location
  # end 
  has_many :comments
  belongs_to :user
  belongs_to :circle
  has_one :location, dependent: :destroy
  validates :text, presence: true
  has_attached_file :image, :styles => { :medium => "600x600>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def self.search(search)
    if search
      where("text LIKE ?", "%#{search}%")
    else
      all
    end
  end

end
