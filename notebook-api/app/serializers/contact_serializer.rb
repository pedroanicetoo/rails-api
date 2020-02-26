class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :birthdate

  # associations
  belongs_to :kind ##, optional: true
  has_many :phones
  has_one :address


  def attributes(*args)
  	h = super(*args)
  	# pt-BR
  	# h[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?)
  	# h[:created_at] = (I18n.l(object.created_at) unless object.created_at.blank?)
  	# h[:updated_at] = (I18n.l(object.created_at) unless object.updated_at.blank?)
  	h[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
  	h[:created_at] = object.created_at.to_time.iso8601 unless object.created_at.blank?
  	h[:updated_at] = object.updated_at.to_time.iso8601 unless object.updated_at.blank?
  	h
  end

end
