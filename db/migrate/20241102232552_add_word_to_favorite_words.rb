class AddWordToFavoriteWords < ActiveRecord::Migration[7.2]
  def change
    add_column :favorite_words, :word, :string
  end
end
