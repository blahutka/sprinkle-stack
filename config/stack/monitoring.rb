package :monit, :provides => :monitoring do
  description "Monit Monitoring"
  apt "monit"

  default_file = "/etc/default/monit"
  transfer 'config/stack/config_files/monit', default_file, :sudo => true
  #  "~/monit" do
  #post :install, "mv ~/monit #{default_file}"
  #end

  verify do
    has_file '/usr/sbin/monit'
    file_contains default_file, "startup=1"
  end

  requires :build_essential

end
