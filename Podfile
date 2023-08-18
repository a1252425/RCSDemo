platform :ios, '13.0'

target 'RCSDemo' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  inhibit_all_warnings!
  
  # Pods for RCSDemo
  
  # Rong Cloud
  pod 'RongCloudOpenSource/IMKit', '5.6.1'
#  pod 'RongCloudOpenSource/IMKit', '5.1.9.4'
#  pod 'RongCloudOpenSource/IMKit', '5.0.0'
#  pod 'RongCloudOpenSource/Sight'
#  pod 'RongCloudOpenSource/RongSticker', '5.4.7'
#  pod 'RongCloudOpenSource/ContactCard'
#  pod 'RongCloudOpenSource/IFly'
#  pod 'RongCloudOpenSource/LocationKit'
#  pod 'RongCloudOpenSource/RongCallKit'
#  pod 'RongCloudOpenSource/IMKit', :path=>'~/workspace/ios-ui-sdk-set'


  # Common
  pod 'Masonry'
  pod 'Aspects'
  pod 'AFNetworking'
  
  # Other
#  pod 'AgoraAudio_iOS'
  
  target 'RCSDemoTests' do
    inherit! :search_paths
    # Pods for testing
    #pod 'OCMock'
  end
  
  target 'RCSDemoUITests' do
    # Pods for testing
  end
  
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['CODE_SIGNING_ALLOWED'] = 'NO'
      config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
    end
  end
end
