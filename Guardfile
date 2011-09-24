guard 'cucumber', cli: '--format progress --no-profile FAILFAST=true', all_on_start: false, keep_failed: false, all_after_pass: false do
  watch(%r{features/.+\.feature})
end

guard 'minitest', drb: false, rubygems: false, bundler: false do
  watch(%r{app/(.+)/(.+)\.rb})                  { |m| "spec/#{m[1]}/#{m[2]}_spec.rb" }
  watch(%r{spec/(.+)/(.+)_spec\.rb})
  watch(%r{spec/spec_helper.rb})               { "test" }
end

guard 'shell' do
  watch('db/schema.rb') { `rake test:prepare` }
end
