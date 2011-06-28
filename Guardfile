guard 'annotate' do
  watch( 'db/schema.rb' )
end

guard 'cucumber', cli: '--format progress --no-profile' do
  watch(%r{features/.+\.feature})
  watch(%r{features/step_definitions/(.+)_steps\.rb}) { |m| Dir[File.join("**/#{m[1]}.feature")][0] }
end

guard 'minitest', drb: false do
  watch(%r{app/(.+)/(.+)\.rb})                  { |m| "test/unit/#{m[1]}/#{m[2]}_test.rb" }
  watch(%r{test/unit/(.+)/(.+)_test\.rb})
  watch(%r{test/test_helper.rb})                       { "test" }
end
