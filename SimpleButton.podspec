Pod::Spec.new do |s|
  s.name                  = "SimpleButton"
  s.version               = "5.0.0"
  s.summary               = "Simple UIButton subclass with additional state change animations (e.g. backgroundColor)"
  s.description           = "Simple UIButton subclass with animated, state-aware attributes. Easy to subclass and configure!"
  s.homepage              = "https://github.com/aloco/SimpleButton"
  s.license               = { :type => "MIT", :file => "LICENSE" }
  s.author                = { "Andreas Tinoco Lobo" => "andreas@tinoco-lobo.at" }
  s.platform              = :ios
  s.ios.deployment_target = "12.0"
  s.source                = { :git => "https://github.com/aloco/SimpleButton.git", :tag => '5.0' }
  s.requires_arc          = true
  s.source_files          = "SimpleButton/*.swift"
  s.swift_version         = "5.0"
end
