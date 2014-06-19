class User < ActiveRecord::Base
  has_and_belongs_to_many :writers, class_name: "User",
    foreign_key: "reader_id",
    association_foreign_key: "writer_id"


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, dependent: :destroy


  has_attached_file :avatar, :styles => {:medium => "300x300>", :small => "100x100>"}, :default_url => "no_avatar.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates :name, :surname, :nic, :city, presence: true

  def self.search(search)
    if search
      User.where('nic LIKE '+"'%#{search}%'")
    else
      User.all
    end
  end
end
