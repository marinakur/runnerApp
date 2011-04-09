# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
RunnerApp::Application.initialize!

#marina: collect GC statistics for Ruby EE
#GC.enable_stats
