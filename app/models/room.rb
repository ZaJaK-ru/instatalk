class Room < ApplicationRecord
  before_create :generate_token
  has_many :messages, dependent: :destroy
  belongs_to :user

  private

  def generate_token
    self.token = SecureRandom.hex(2)
  end
end
