class CreateBoardComments < ActiveRecord::Migration[7.1]
  def change
    create_table :board_comments do |t|
      t.text :comment
      t.references :board, null: false, foreign_key: true

      t.timestamps
    end
  end
end
