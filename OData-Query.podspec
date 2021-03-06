
Pod::Spec.new do |s|
  s.name             = "OData-Query"
  s.version          = "0.0.1"
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
