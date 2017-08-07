require 'active_model'
require 'i18n'

class UniquenessWithDeletedValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if record.class.with_deleted.where(attribute => value).where.not(id: record.id).exists?
      record.errors.add(attribute, options[:message] || I18n.t('.activerecord.errors.base.taken'))
    end
  end
end

module ClassMethods
  def validates_uniqueness_with_deleted_of(*attr_names)
    validates_with UniquenessWithDeletedValidator, _merge_attributes(attr_names)
  end
end
