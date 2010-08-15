package :build_essential do
  description 'Build tools'
  apt 'build-essential fail2ban' do
    pre :install, 'apt-get update'
    pre :install, 'apt-get upgrade'
  end
end

package :htop do
  apt 'htop'

  verify do
    has_executable 'htop'
  end
end


package :app_dir do
  noop do
    pre :install, 'mkdir -p /u'
    pre :install, 'chown -R deploy:deploy /u'
    pre :install, 'chmod -R ug=rwx /u'
  end

  verify do
    has_directory '/u'
  end

end
