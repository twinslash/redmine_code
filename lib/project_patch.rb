require_dependency 'project'

module ProjectPatch
  def self.included(base) 
    base.extend(ClassMethods)
    base.send(:include, InstanceMethods)
    base.unloadable 
    base.has_many :codes
  end

  module ClassMethods    
  end

  module InstanceMethods
  end

end