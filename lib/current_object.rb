require 'thread'

module CurrentObject
  def self.included(base)
    base.send(:include, CurrentObject::InstanceMethods)
    base.send(:extend, CurrentObject::ClassMethods)
  end

  module InstanceMethods
    # current! - Stores the class instance as the "current" instance for that class.
    #
    # @foo = Foo.new
    # @foo.current!
    #
    def current!
      Thread.current[self.class.name] = self
    end
  end

  module ClassMethods
    # current - Returns the instance of the class that is stored as the "current" instance.
    #
    # @foo = Foo.new
    # @foo.current!
    #
    # Foo.current
    # # => @foo
    def current
      Thread.current[self.name]
    end

    # clear_current! - Have your class forget about the "current" instance
    #
    # @foo = Foo.new
    # @foo.current!
    #
    # Foo.current
    # # => @foo
    #
    # Foo.clear_current!
    # Foo.current
    # # => nil
    def clear_current!
      Thread.current[self.name] = nil
    end
  end
end
