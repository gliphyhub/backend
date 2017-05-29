module PermissionsConcern
	extend ActiveSupport::Concern
	def is_normal?
		self.tipo.id >= 3
	end
	def is_prof?
		self.tipo.id == 2
	end
	def is_admin?
		self.tipo.id == 1
	end
end