class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_attached_file :head_shot, styles: { medium: "300x300>", thumb: "100x100>", nano: "25x25>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :head_shot, content_type: /\Aimage\/.*\Z/

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
  
  validates :name, presence: true

  has_many :topics
  has_many :comments

  has_many :like_topics, :dependent => :destroy
  has_many :liked_topics, :through => :like_topics, :source => :topic


  def self.from_omniauth(auth)
    # Case 1: Find existing user by facebook uid
    user = User.find_by_fb_uid( auth.uid )
    if user
      user.fb_token = auth.credentials.token
      #user.fb_raw_data = auth
      user.save!
      return user
    end

    # Case 2: Find existing user by email
    existing_user = User.find_by_email( auth.info.email )
    if existing_user
      existing_user.fb_uid = auth.uid
      existing_user.fb_token = auth.credentials.token
      #existing_user.fb_raw_data = auth
      existing_user.save!
      return existing_user
    end

    # Case 3: Create new password
    user = User.new
    user.fb_uid = auth.uid
    user.fb_token = auth.credentials.token
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = user.email.split("@").first
    #user.fb_raw_data = auth
    user.save!
    return user
  end

  def had_liked_topic?(topic)
    self.liked_topic_ids.include?( topic.id )
  end

  def can_edit?(content)
    self.id == content.user_id
  end

end
