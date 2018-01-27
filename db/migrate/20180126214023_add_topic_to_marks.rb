class AddTopicToMarks < ActiveRecord::Migration[5.1]
  def change
    add_column(:marks, :topic, :string, null: false)
  end
end
