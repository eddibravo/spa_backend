class CreatePgSearchDocuments < ActiveRecord::Migration
  def self.up
    execute 'create extension IF NOT EXISTS pg_trgm;'
  end

  def self.down
    execute 'drop extension IF EXISTS pg_trgm;'
  end
end
