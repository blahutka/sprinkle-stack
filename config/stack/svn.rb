package :svn, :provides => :scm do
  description 'Subversion Version Control'
  apt 'subversion'
  
  verify do
    has_file '/usr/bin/svn'
  end
end
