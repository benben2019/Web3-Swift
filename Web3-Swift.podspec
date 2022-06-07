#
# Be sure to run `pod lib lint Web3-Swift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Web3-Swift'
  s.version          = '0.1.1'
  s.summary          = 'A pure swift Ethereum Web3 library'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  A pure swift Ethereum Web3 library. Refer to https://github.com/Boilertalk/Web3.swift
                       DESC

  s.homepage         = 'https://github.com/benben2019/Web3-Swift'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'benben' => 'hzcly98@gmail.com' }
  s.source           = { :git => 'https://github.com/benben2019/Web3-Swift.git', :tag => s.version.to_s }
  s.swift_version    = "5.0"

  s.ios.deployment_target = '9.0'

  s.source_files = 'Web3-Swift/Classes/**/*'
  
  s.dependency 'BigInt', '~> 5.0.0'
  s.dependency 'CryptoSwift', '~> 1.0.0'
  s.dependency 'secp256k1.swift', '~> 0.1.1'
  s.dependency 'PromiseKit', '~> 6.0.0'
  
  
end
