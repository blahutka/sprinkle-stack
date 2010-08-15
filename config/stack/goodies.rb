package :goodies do
  description 'Different useful utilities required on the server'
  #Sysadmin tools
  apt %w(fail2ban netdiag htop vim wget sysstat fish zsh logrotate rkhunter etckeeper)

  verify do
    has_file '/usr/sbin/trafshow'
    has_file '/usr/bin/htop'
    has_file '/usr/bin/vim'
    has_file '/usr/bin/wget'
    has_file '/usr/bin/iostat'
    has_file '/usr/bin/fish'
    has_file '/usr/bin/zsh'
    has_file '/usr/sbin/logrotate'
    has_file '/usr/bin/rkhunter'
    has_file '/usr/sbin/etckeeper'
  end
   
  requires :build_essential
end
