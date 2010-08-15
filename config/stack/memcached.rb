package :memcached_daemon, :provides => :memcached do
  description 'Memcached, a distributed memory object store'
  apt %w( memcached )
  
  post :install, "/etc/init.d/memcached start"
  post :install, "sudo ldconfig"
  
  verify do
    has_executable 'memcached'
  end

  optional :memcache_ruby
end

package :libmemcached do
  source 'http://download.tangent.org/libmemcached-0.43.tar.gz'
  requires :memcached_daemon
end

package :memcache_ruby do 
  gem 'memcache-client'

  requires :ruby, :memcached

  verify do
    ruby_can_load 'memcache'
  end
end

