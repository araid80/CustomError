#
# Be sure to run `pod lib lint CustomError.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CustomError'
  s.version          = '1.0.0'
  s.summary          = 'CustomError for apple'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = "description"

  s.homepage         = 'https://github.com/araid80/CustomError'
  s.license          = { :type => 'MIT' }
  s.author           = { 'araid80' => 'araid80@gmail.com' }
  s.source           = { :http => 'https://github.com/araid80/CustomError.git' }
  s.documentation_url = 'https://github.com/araid80/CustomError'

  s.ios.deployment_target = '9.0'
  s.tvos.deployment_target = '15.4'
  s.osx.deployment_target = '10.15'
  s.watchos.deployment_target = '8.4'

  s.source_files = 'CustomError/**/*.swift'
  s.framework = 'Foundation'
  s.swift_version = '5'
end
