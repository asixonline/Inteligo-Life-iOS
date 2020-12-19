# Uncomment the next line to define a global platform for your project
platform :ios, '13.5'

post_install do |pi|
    pi.pods_project.targets.each do |t|
      t.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.5'
      end
    end
end

target 'InteligoLife' do
  #only copy below line
  pod 'OneSignal', '>= 3.0.0', '< 4.0'
end

target 'OneSignalNotificationServiceExtension' do
  #only copy below line
  pod 'OneSignal', '>= 3.0.0', '< 4.0'
end

# add pods for desired Firebase products
# https://firebase.google.com/docs/ios/setup#available-pods

