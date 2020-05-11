 
Pod::Spec.new do |s|
  s.name             = 'NPNavigationBar'
  s.version          = '1.0.3'
  s.summary          = 'Swift导航栏'
  s.description      = <<-DESC
                    一行代码调用，高度自定义导航栏
                       DESC
  s.homepage         = 'https://github.com/iyongjie/NPNavigationBar'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'iyongjie' => 'iyongjie@yeah.com' }
  s.source           = { :git => 'https://github.com/iyongjie/NPNavigationBar.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'

  s.source_files = 'NPNavigationBar/*'
  s.dependency 'SnapKit'

  
end
