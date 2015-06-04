package 'ImageMagick' do
  package_name value_for_platform(
    ['centos','redhat','fedora','amazon'] => {'default' => 'ImageMagick'}
#    'ubuntu' => {'default' => ''}
  )
  action :install
end

package 'ImageMagick-c++-devel' do
  package_name value_for_platform(
    ['centos','redhat','fedora','amazon'] => {'default' => 'ImageMagick-c++-devel'}
#    'ubuntu' => {'default' => ''}
  )
  action :install
end
