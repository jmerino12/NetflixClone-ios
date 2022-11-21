# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'

workspace 'MovieApp'

alamofire = 'Alamofire'
alamofireVersion = '~> 5.6.2'

target 'Presentation' do
  project 'Presentation/Presentation.xcodeproj'
  use_frameworks!
  # Pods for Presentation
  pod 'Kingfisher', '~> 7.0'
  pod alamofire, alamofireVersion
end

target 'Infraestructure' do
  project 'Infraestructure/Infraestructure.xcodeproj'
  use_frameworks!
  # Pods for Infraestructure
  pod alamofire, alamofireVersion
end
