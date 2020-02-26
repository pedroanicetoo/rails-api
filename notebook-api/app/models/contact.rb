class Contact < ApplicationRecord
	# associations
	belongs_to :kind ##, optional: true
	has_many :phones
	has_one :address

	accepts_nested_attributes_for :phones, allow_destroy: true
	accepts_nested_attributes_for :address, update_only: true

	def as_json(options={})
		h = super(options)
		h[:birthdate] = (I18n.l(self.birthdate) unless self.birthdate.blank?)
		h[:created_at] = (I18n.l(self.created_at) unless self.created_at.blank?)
		h[:updated_at] = (I18n.l(self.created_at) unless self.updated_at.blank?)
		h
	end

	# def birthdate_br
	# 	I18n.l(self.birthdate) unless self.birthdate.blank?
	# end

	# def to_br
	# 	{
	# 		name: self.name,
	# 		email: self.email,
	# 		birthdate: (I18n.l(self.birthdate) unless self.birthdate.blank?)
	# 	}
	# end

	# def author
	# 	"Pedro"
	# end

	# def kind_description
	# 	self.kind.description
	# end

# def hello
# 	I18n.t('hello')
# end

# def i18n
# 	I18n.default_locale
# end

end
