cask :v1 => 'virtualbox_and_extensionpack_4328100309' do
  version '4.3.28-100309'
  sha256 '16ef55298abe5de8cd0e9ac88895d6404cde5a17d9aa126f8860c411c4eeeac2'

  url "http://download.virtualbox.org/virtualbox/#{version.split('-')[0]}/VirtualBox-#{version}-OSX.dmg"
  homepage 'http://www.virtualbox.org'
  license :unknown

  pkg 'VirtualBox.pkg'

  postflight do
    system("wget http://download.virtualbox.org/virtualbox/#{version.split('-')[0]}/Oracle_VM_VirtualBox_Extension_Pack-#{version}.vbox-extpack")
    system("open Oracle_VM_VirtualBox_Extension_Pack-#{version}.vbox-extpack")
  end

  uninstall :script => { :executable => 'VirtualBox_Uninstall.tool', :args => %w[--unattended] }
end
