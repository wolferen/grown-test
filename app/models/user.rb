class User < ApplicationRecord
  has_many :phones, dependent: :destroy
  has_many :browsers, dependent: :destroy
  has_many :tablets, dependent: :destroy

  def device_data
    {
      phones: phones,
      browsers: browsers,
      tablets: tablets
    }
  end
end
