class AddShortNameToLanguage < ActiveRecord::Migration
  def self.up
    add_column  :languages, :short_name, :string
  end

  def self.down
    remove_column :languages, :short_name
  end
end
