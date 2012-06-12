require 'bcrypt'
class User < ActiveRecord::Base
  attr_accessible :name, :email, :hashed_password, :hashed_password_confirmation
  attr_accessor :hashed_password_confirmation
  has_many :posts, :dependent => :destroy
  has_many :comments, :dependent => :destroy
    validates_confirmation_of :hashed_password, :if=>:password_changed?
    validates :hashed_password, :presence => true
    validates :name, :presence => true
    validates :email, :presence => true
    validates_uniqueness_of :email
    validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "Invalid email"  
    
    validates :hashed_password_confirmation, :presence => true
    

    before_save :hash_password, :if => :password_changed?

    def password_changed?
      self.hashed_password.present?
    end

    def self.authenticate(email, password)
      # Because we use bcrypt we can't do this query in one part, first
      # we need to fetch the potential user
      
      if user = find_by_email(email)
        # Then compare the provided password against the hashed one in the db.
       
        if BCrypt::Password.new(user.hashed_password).is_password? password
          # If they match we return the user 
          return user
        end
      end
      # If we get here it means either there's no user with that email, or the wrong
      # password was provided.  But we don't want to let an attacker know which. 
      return nil
    end

private
    # This is where the real work is done, store the BCrypt has in the
    # database
    def hash_password
      self.hashed_password = BCrypt::Password.create(self.hashed_password)
    end


end
