class AddGroupRelations < ActiveRecord::Migration[5.1]
  def change
    add_column(:students, :group_id, :string, null: false, after: :id)
    add_index(:students, :group_id)
    add_column(:teachers, :group_id, :string, null: false, after: :id)
    add_index(:teachers, :group_id)
    add_index(:lessons, :group_id)
    add_index(:marks, :group_id)
  end
end
