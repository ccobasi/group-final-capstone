class AddCityToReservation < ActiveRecord::Migration[6.1]
  def change
    add_reference :reservations, :city, foreign_key: true
  end
end
