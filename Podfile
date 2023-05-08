platform :ios, '11.0'

target 'RCSDemo' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  inhibit_all_warnings!
  
  # Pods for RCSDemo
  
  # Rong Cloud
#  pod 'RongCloudIM/IMKit', '2.9.19'
#  pod 'RongCloudOpenSource/IMKit', '5.4.2'
#  pod 'RongCloudOpenSource/IMKit', :path => '~/workspace/ios-ui-sdk-set'
#  pod 'RongCloudOpenSource/Sight'
#  pod 'RongCloudOpenSource/RongSticker'
#  pod 'RongCloudOpenSource/ContactCard'
#  pod 'RongCloudOpenSource/IFly'
#  pod 'RongCloudOpenSource/LocationKit'
#  pod 'RongCloudRTCOpenSource/RongCallKit', '5.4.0'

  # Common
  pod 'Masonry'
  pod 'Aspects'
  pod 'GTSDK'
  
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
      config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
    end
  end
end
