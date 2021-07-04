class AddDateToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :date, :date
    add_column :articles, :status, :boolean,  default: false
  end
end
