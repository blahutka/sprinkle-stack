package :mercurial, :provides => :scm do
  description 'Mercurial Distributed Version Control'
  apt 'mercurial' 

  verify do
    has_file '/usr/bin/hg'
  end
end

package :svn, :provides => :scm do 
  description 'Subversion Version Control'
  apt 'subversion'

  verify do
    has_file '/usr/bin/svn'
  end
end

