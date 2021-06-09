class Book < ApplicationRecord
  
  belongs_to :user
  
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  scope :created_today, -> { where(created_at: Time.now.in_time_zone("Tokyo").all_day) }
  scope :created_yesterday, -> { where(created_at: 1.day.ago.in_time_zone("Tokyo").all_day) }
  scope :created_2_day_ago, -> { where(created_at: 2.days.ago.in_time_zone("Tokyo").all_day) }
  scope :created_3_day_ago, -> { where(created_at: 3.days.ago.in_time_zone("Tokyo").all_day) }
  scope :created_4_day_ago, -> { where(created_at: 4.days.ago.in_time_zone("Tokyo").all_day) }
  scope :created_5_day_ago, -> { where(created_at: 5.days.ago.in_time_zone("Tokyo").all_day) }
  scope :created_6_day_ago, -> { where(created_at: 6.days.ago.in_time_zone("Tokyo").all_day) }
  scope :created_1_week, -> { where("created_at >= ?", 6.days.ago.in_time_zone("Tokyo").beginning_of_day) }
  scope :created_2_week_sum, -> { where("created_at >= ?", 13.days.ago.in_time_zone("Tokyo").beginning_of_day) }
  
  scope :search, -> (search_params) do
    return if search_params.blank?
    created_day_search(search_params[:date])
  end
  
  scope :created_day_search, -> (date) { where(created_at: date.in_time_zone("Tokyo").all_day) if date.present? }
  
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
