class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_attached_file :head_shot, styles: { medium: "300x300>", thumb: "100x100>", nano: "50x50>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :head_shot, content_type: /\Aimage\/.*\Z/

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  validates :name, presence: true

  has_many :topics
  has_many :comments

end
