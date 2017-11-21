Pod::Spec.new do |spec|
  spec.name         = 'UIView+Positioning'
  spec.version      = '1.6'
  spec.license      = { :type => 'MIT' }
  spec.homepage     = 'https://github.com/freak4pc/UIView-Positioning'
  spec.authors      = { 'Shai Mishali' => 'freak4pc@gmail.com' }
  spec.summary      = 'UIView+Positioning provides shorthand methods and helpers to define the frame properties of any UIView based object in an easy fashion.'
  spec.source       = { :git => 'https://github.com/freak4pc/UIView-Positioning.git', :tag => 'v1.6' }
  spec.source_files = 'UIView+Positioning.swift'
  spec.platform     = :ios, '8.0'
end
