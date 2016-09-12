class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
  :recoverable, :rememberable, :trackable
  
  has_many :authorizations
  
  validates :email, presence: true, if: :auth_empty?
  validates :email, uniqueness: true
  validates :password, :length => {:within => 6..40}

  def self.from_omniauth(auth, current_user)
    
    authorization = Authorization.find auth
    if authorization.user.blank?

      user = current_user || find_by_email(auth["info"]["email"])
      
      if user.blank?
        user = User.new
        user.password = Devise.friendly_token[0,10]
        user.name = auth.info.name
        user.email = auth.info.email
        if auth.provider == "twitter" 
          user.save(:validate => false) 
        else
          user.save
        end
      end
      
      authorization.username = auth.info.nickname
      authorization.user_id = user.id
      authorization.save
    end

    authorization.user
  end

  def self.new_with_session(params, session)
    user_attributes = session["devise.user_attributes"]     
    if user_attributes
      new(user_attributes, without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end	
    else
      super
    end	
  end

  def username 
    authorizations.pluck(:username).to_s.delete! '[""]'
  end

  def auth_empty?
    authorizations.empty?
  end

  private 

end
