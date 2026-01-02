# Generate XML test reports that can be parsed by CircleCI
if ENV['CIRCLECI']
  require 'minitest/ci'

  Minitest::Ci.report_dir = './reports'
end
