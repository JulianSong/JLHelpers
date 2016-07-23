Pod::Spec.new do |s|
  s.name             = 'JLHelpers'
  s.version          = '0.1.0'
  s.summary          = 'Common helpers.'
  s.description      = <<-DESC
Utils for common use.
                       DESC
  s.homepage         = 'https://github.com/JulianSong/JLHelpers'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'julian.song' => 'geeksong@gmail.com' }
  s.source           = { :git => 'https://github.com/JulianSong/JLHelpers.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'JLHelpers/Classes/*'
  s.public_header_files = 'JLHelpers/Classes/*.h'
  s.frameworks = 'Foundation'
end
