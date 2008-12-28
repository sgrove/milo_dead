class CreateTranslations < ActiveRecord::Migration
  def self.up
    create_table :translations do |t|
      t.string :translation
      t.references :language
      t.references :phrase

      t.timestamps
    end
  end

  def self.down
    drop_table :translations
  end
end
