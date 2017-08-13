require 'spec_helper'

RSpec.describe Praise::Runner do
  it 'shows all gems on list' do
    out = StringIO.new
    $stdout = out

    Praise::Runner.new.list(['rails'])
    expect(out.string).to eq "{\"rails\"=>\"http://github.com/rails/rails\"}\n"
  end
end
