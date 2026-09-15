require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "react-native-amap3d"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = package["homepage"]
  s.license      = package["license"]
  s.authors      = package["author"]

  # Xcode 27 部署目标范围为 15.0–27.0；低于 15 无法编译。
  s.platforms    = { :ios => "15.0" }
  s.source       = { :git => "https://github.com/Bilinxian/react-native-amap3d.git", :tag => "#{s.version}" }

  s.source_files = "lib/ios/**/*.{h,m,mm,swift}"

  s.dependency "React-Core"
  # 9.6.x MAMapKit 在 Xcode 16+/27 链接时报 Pointer not aligned；10.1.600 已修复。
  s.dependency 'AMap3DMap', '10.1.600'
end
