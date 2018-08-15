class AddUriShortToCyboxUris < ActiveRecord::Migration
  def change
    if !ActiveRecord::Base.connection.column_exists?(:cybox_uris, :uri_short)
      add_column :cybox_uris, :uri_short, :string, limit: 255
      add_index :cybox_uris, :uri_short
    end
    
    reversible do |dir|
      dir.up do
        # Populate the new column with data
        execute "UPDATE cybox_uris SET uri_short = SUBSTR(uri_normalized, 1, 255)"
      end
      # No Down is needed, dropping the column is enough
    end
 
  end
end
