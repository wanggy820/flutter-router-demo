#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'FlutterApp'
  s.version          = '0.0.1'
  s.summary          = '引入Flutter App.framework'
  s.description      = <<-DESC
引入Flutter App.framework.
                       DESC
  s.license          = 'MIT' 
  s.homepage         = 'http://tjos.com/seeyon/main.do'
  s.author           = { 'tojoy' => 'wangchunxiang@tojoy.com' }

  s.source       = { :svn => "", :tag => "0.0.1" }
#  s.dependency 'Flutter'
  s.frameworks  = "App"
  s.resource = ['images/*.png']
  s.vendored_frameworks = '.ios/Flutter/App.framework'
  s.ios.deployment_target = '8.0'
end

