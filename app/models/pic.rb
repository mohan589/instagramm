class Pic < ApplicationRecord
  has_many :comments, :through => 'user'
  has_many :comments
  # :dependent => :destroy pic delete functionality need to check with this.
  acts_as_votable
  belongs_to :user
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
