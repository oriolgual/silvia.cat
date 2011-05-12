require 'simplecov'
SimpleCov.start :rails do
  %w(Services Cells Uploaders).each do |name|
    add_group name, "app/#{name.downcase}"
  end
  add_filter do |source_file|
    source_file.filename =~ %r{vendor/plugins}
  end
end
