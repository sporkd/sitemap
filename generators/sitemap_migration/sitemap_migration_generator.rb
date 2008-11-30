require File.expand_path(File.dirname(__FILE__) + "/lib/insert_routes.rb")

class SitemapMigrationGenerator < Rails::Generator::NamedBase
  attr_reader :sitemap_table_name
  def initialize(runtime_args, runtime_options = {})
    @sitemap_table_name = 'sitemap'
    runtime_args << 'add_sitemap_table' if runtime_args.empty?
    super
  end

  def manifest
    record do |m|
      m.route_resources :sitemap_static_links
      m.route_resources :sitemap_widgets
      m.route_resources :sitemap_settings
      m.route_resource :sitemap
      m.migration_template 'migration.rb', 'db/migrate'
    end
  end
end

