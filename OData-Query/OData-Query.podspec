#
# Be sure to run `pod lib lint OData-Query.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "OData-Query"
  s.version          = "1.0"
  s.summary          = "Library for creating OData formatted paths."
  s.description      = <<-DESC
                        Create OData formatted Sharepoint url paths
                       DESC
  s.homepage         = "https://github.com/FrankChippan/OData-Query"
  s.license          = 'MIT'
  s.author           = { "Ewan Thomas" => "ewanthomas00@gmail.com" }
  s.source           = { :git => "https://github.com/FrankChippan/OData-Query.git", :tag => s.version.to_s }
  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'OData-Query' => ['Pod/Assets/*.png']
  }
end
