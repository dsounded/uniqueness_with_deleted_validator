$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'uniqueness_with_deleted_validator'

require 'rubygems'
require 'rspec'
require 'active_model'

class TestModel
  include ActiveModel::Validations
  include ActiveModel::Dirty

  define_attribute_methods :name, :id

  def self.model_name
    ActiveModel::Name.new(self, nil, 'test')
  end

  attr_reader :name, :id

  def initialize(attributes = {})
    @attributes = attributes
    @name = attributes.fetch(:name)
  end
end
