package :build_essential do
  description 'Build tools'
  apt 'build-essential fail2ban' do
    pre :install, 'apt-get update'
    pre :install, 'apt-get upgrade'
  end
end
