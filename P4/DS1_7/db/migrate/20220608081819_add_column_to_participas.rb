class AddColumnToParticipas < ActiveRecord::Migration[7.0]
  def change
    add_column :participas, :fecha, :date
  end
end
