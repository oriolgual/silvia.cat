guard 'cucumber', cli: '--format progress --no-profile FAILFAST=true', all_on_start: false, keep_failed: false do
  watch(%r{features/.+\.feature})
end

guard 'minitest', drb: false do
  watch(%r{app/(.+)/(.+)\.rb})                  { |m| "specs/#{m[1]}/#{m[2]}_spec.rb" }
  watch(%r{specs/(.+)/(.+)_spec\.rb})
  watch(%r{specs/spec_helper.rb})               { "test" }
end

guard 'shell' do
  watch('db/schema.rb') { `rake test:prepare` }
end
