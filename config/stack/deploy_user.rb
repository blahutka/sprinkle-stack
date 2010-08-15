package :deploy_user do
  DEPLOY_USER="deploy"
  DEPLOY_GROUP="deploy"

  noop do 
    pre :install, "groupadd #{DEPLOY_GROUP}"
    pre :install, "useradd -g #{DEPLOY_GROUP} -c 'Rails Deployer' -m -s /bin/bash #{DEPLOY_USER}"
    post :install, "mkdir /u"
    post :install, "chown -R #{DEPLOY_USER}:#{DEPLOY_GROUP} /u"
  end

  verify do
    file_contains '/etc/passwd', "#{DEPLOY_USER}:"
    has_directory "/home/#{DEPLOY_USER}"
  end

  optional :deploy_keys

end

package :deploy_keys do

  noop do
    pre :install, "mkdir -p /home/#{DEPLOY_USER}/.ssh" 
  end

  authorized_keys = Dir.glob("../../*.pub").map do |keyfile|
    key = File.read(keyfile)
  end.join("")

  push_text authorized_keys, "/home/#{DEPLOY_USER}/.ssh/authorized_keys", :sudo => true do
    pre :install, "mkdir -p /home/#{DEPLOY_USER}/.ssh"
    pre :install, "tee /home/#{DEPLOY_USER}/.ssh/authorized_keys </dev/null"
    post :install, "chmod 0600 /home/#{DEPLOY_USER}/.ssh/authorized_keys"
  end
  
  noop do
    post :install, "chown -R #{DEPLOY_USER}:#{DEPLOY_GROUP} /home/#{DEPLOY_USER}/.ssh/"
  end
end
