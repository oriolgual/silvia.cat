DatabaseCleaner.strategy = :truncation
class MiniTest::Spec
  before do
    DatabaseCleaner.start
  end

  after do
    DatabaseCleaner.clean
  end
end
