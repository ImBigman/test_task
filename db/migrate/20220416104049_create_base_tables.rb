class CreateBaseTables < ActiveRecord::Migration[5.0]
  def change
    create_table 'posts' do |t|
      t.string :author, null: false
      t.string :title, null: false
      t.string :body, null: false
      t.timestamps null: false
    end

    create_table 'histories' do |t|
      t.string     :type,          null: false
      t.string     :user,          null: false
      t.datetime   :created_at,    null: false
      t.belongs_to :post,          null: false, foreign_key: true
    end
  end
end
