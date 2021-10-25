class Weather < ApplicationRecord
  belongs_to :user

  validates :city, presence: true

  def self.to_celcius(temp)
   return 0 if temp == nil

   temp = (temp - 273.15)

   number = temp.to_s.split('.')
   result = number.last.to_i

   if result >= 50
     temp.ceil
   else
     temp.floor
   end
  end

  def self.date_format(date)
    date.strftime("%F")
  end
end
