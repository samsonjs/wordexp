# Generate XML test reports that can be parsed by CircleCI
if ENV['CIRCLECI']
  require 'minitest/ci'

  Minitest::Ci.report_dir = File.join(ENV.fetch('CIRCLE_TEST_REPORTS'), 'reports')
end
