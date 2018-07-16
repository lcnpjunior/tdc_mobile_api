class Contact < ApplicationRecord
	validates :nome, presence: {message: "Campo `Nome` é obrigatório."}
	validates :nome, length: { minimum: 5, message: "Minimo de 5 caracteres para o campo `Nome`." }
	validates :nome, length: { maximum: 30, message: "Máximo de 30 caracteres para o campo `Nome`." }
	validates :email, presence: {message: "Campo `E-mail` é obrigatório."}, format: { with: URI::MailTo::EMAIL_REGEXP } 
	validates :assunto, presence: {message: "Campo `Assunto` é obrigatório."}

	before_validation :strip_whitespace

	def strip_whitespace
		self.nome = self.nome.strip unless self.nome.nil?
		self.email = self.email.strip unless self.email.nil?
	end

end
