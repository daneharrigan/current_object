require 'spec_helper'

class Foo
  include CurrentObject
end

describe Foo do
  before(:each) { @foo = Foo.new }

  describe '#current!' do
    it 'stores the class instance in Thread.current[<class-name>]' do
      @foo.current!
      Thread.current['Foo'].should == @foo
    end

    it 'returns itself' do
      @foo.current!.should == @foo
    end
  end

  describe '.current' do
    it 'returns the value stored in Thread.current[<class-name>]' do
      Thread.current['Foo'] = @foo
      Foo.current.should == @foo
    end
  end
end
