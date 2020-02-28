class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :birthdate

  # associations
  belongs_to :kind do
    link(:related) { contact_kind_url(object.id) }
  end

  has_many :phones do
    link(:related) { contact_phones_url(object.id) }
  end 
  
  has_one :address do 
    link(:related) { contact_address_url(object.id) }
  end

  # meta do
  #   { author: "Pedro Pereira"}
  # end

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
