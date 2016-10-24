RSpec::Matchers.define :be_into_array do |expected|
  match do |actual|
    expected.include? actual
  end
  failure_message do |actual|
    "expected that #{expected} should include #{actual}"
  end
end