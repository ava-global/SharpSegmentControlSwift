#
# Be sure to run `pod lib lint SharpSegmentControlSwift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SharpSegmentControlSwift'
  s.version          = '0.1.7'
  s.summary          = 'A short description of SharpSegmentControlSwift.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
FEAT: Initial frameworks suuport set default selectedIndex
FIX: Initial frameworks
                       DESC

  s.homepage         = 'https://github.com/ava-global/SharpSegmentControlSwift'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'nattaponGolf123' => 'taponpa@gmail.com' }
  s.source           = { :git => 'https://github.com/ava-global/SharpSegmentControlSwift.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'  
  s.source_files = 'SharpSegmentControlSwift/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SharpSegmentControlSwift' => ['SharpSegmentControlSwift/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
