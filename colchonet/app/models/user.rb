class User < ActiveRecord::Base

	EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

	# validates_presence_of :email, :full_name, :location, :password
	# validates_confirmation_of :password
	# validates_length_of :bio, minimum: 30, allow_blank: false
	# validates_uniqueness_of :email

	validates :email, presence: true,  uniqueness: true
	validates :password, presence: true, confirmation: true
	validates :full_name, presence: true
	validates :location, presence: true
	validates :bio, length: {minimum: 30}, allow_blank: false


	# validate :email_format
	#def email_format
	validate do 
		errors.add(:email, :invalid) unless email.match(EMAIL_REGEXP)
	end

end
