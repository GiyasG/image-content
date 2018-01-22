require 'rails_helper'

require "mongo"
Mongo::Logger.logger.level = ::Logger::INFO
# Mongo::Logger.logger.level = ::Logger::INFO
describe Bar, :type=>:model, :orm=>:mongoid do
  # include Mongoid::Matchers

  include_context 'db_cleanup'

  context Bar do
    it {is_expected.to have_field(:name).of_type(String).with_default_value_of(nil)}
  end

  context "created Bar (Let)" do
    let(:bar) {Bar.create(:name=>"test")}

    include_context 'db_scope'

    it {expect(bar).to be_persisted}
    it {expect(bar.name).to eq("test")}
    it {expect(Bar.find(bar.id)).to_not be_nil}
      # binding.pry
    end

end
