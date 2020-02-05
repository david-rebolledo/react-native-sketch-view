require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name         = "P41Sketch"
  s.version      = package['version']
  s.summary      = package['description']
  s.license      = package['license']

  s.authors      = package['author']
  s.homepage     = package['homepage']
  s.platforms    = { :ios => "9.0", :tvos => "9.2" }
  s.source       = { :git => "https://github.com/david-rebolledo/react-native-sketch-view.git"}
  s.source_files = "ios/**/*.{h,m}"
  s.resources = ["ios/SketchView/SketchViewContainer.xib"]


  s.dependency "React"

end

