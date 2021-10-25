class AddUserToWeathers < ActiveRecord::Migration[6.1]
  def change
    add_reference :weathers, :user, foreign_key: true
  end
end
