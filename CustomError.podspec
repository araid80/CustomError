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
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT' }
  s.author           = { 'wade' => 'araid80@gmail.com' }
  s.source           = { :http => 'https://github.com/araid80/CustomError.git' }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  s.tvos.deployment_target = '15.4'
  s.osx.deployment_target = '10.15'
  s.watchos.deployment_target = '8.4'

  s.source_files = 'CustomError/**/*'
  #s.framework = "AIPlayerBackend"
  #s.vendored_frameworks = 'AIPlayer/Framework/AIPlayerBackend.xcframework'
  
  # s.resource_bundles = {
  #   'AIPlayer' => ['AIPlayer/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  #s.dependency 'Socket.IO-Client-Swift', '~> 15.2.0'
  #s.dependency 'SwiftJWT', '~> 3.6.200'
  #s.dependency 'SSZipArchive', '~> 2.4.2'
  #s.xcconfig = { "OTHER_CFLAGS" => "-fembed-bitcode" }
end
