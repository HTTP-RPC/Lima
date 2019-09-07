Pod::Spec.new do |s|
  s.name            = 'Lima'
  s.version         = '1.3'
  s.license         = 'Apache License, Version 2.0'
  s.homepage        = 'https://github.com/gk-brown/Lima'
  s.author          = 'Greg Brown'
  s.summary         = 'Declarative UI for iOS and tvOS'
  s.source          = { :git => "https://github.com/gk-brown/Lima.git", :tag => s.version.to_s }
  s.swift_version   = '5.0'

  s.ios.deployment_target   = '11.0'
  s.ios.source_files        = 'Lima-iOS/Lima/*.{h,m,swift}'
  s.tvos.deployment_target  = '11.0'
  s.tvos.source_files       = 'Lima-iOS/Lima/*.{h,m,swift}'
end
