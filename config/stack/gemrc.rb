package :gemrc do 
  description "Supply gem sources, turn off ri and rdoc generation"

  config =<<eol
# gemrc for production
---
:sources:
- http://gems.rubyforge.org
- http://gems.github.com
gem: --no-ri --no-rdoc
eol
  
  push_text config, "~/.gemrc"
  verify {file_contains "~/.gemrc", "gemrc for production"}

end

