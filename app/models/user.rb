class User < ActiveRecord::Base
	has_many :wikis, dependent: :destroy

	before_save { self.email = email.downcase if email.present? }	
	after_initialize { self.role ||= :member }


	enum role: [:member, :premium, :admin]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


end
