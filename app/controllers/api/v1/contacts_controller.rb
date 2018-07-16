module Api
	module V1
		class ContactsController < ApplicationController
			def index 
				contacts = Contact.order('created_at DESC');
				render json: {status:'SUCESSO', message:'Contatos obtidos', data:contacts},status: :ok
			end

			def show 
				begin
					contact = Contact.find(params[:id]);
					render json: {status:'SUCESSO', message:'Contato obtido', data:contact},status: :ok
				rescue ActiveRecord::RecordNotFound
					render json: {status:'ERRO', message:'Erro ao obter contato! Contato não encontrado!'},status: :ok
				end
			end

			def create 
				contact = Contact.new(contact_params)

				if contact.save
					render json: {status:'SUCESSO', message:'Contato Salvo', data:contact},status: :ok
				else
					render json: {status:'ERRO', message:'Erro ao salvar o contato', data:contact.errors},status: :unprocessable_entity
				end

			end

			def destroy
				begin
					contact = Contact.find(params[:id])
					contact.destroy
					render json: {status:'SUCESSO', message:'Contato Deletado', data:contact},status: :ok
				rescue ActiveRecord::RecordNotFound
					render json: {status:'ERRO', message:'Erro ao deletar contato! Contato não encontrado!'},status: :ok
				end
			end

			def update
				begin	
					contact = Contact.find(params[:id])
					if contact.update_attributes(contact_params)
						render json: {status:'SUCESSO', message:'Contato Atualizado', data:contact},status: :ok
					else
						render json: {status:'ERRO', message:'Erro ao atualizar contato', data:contact.errors},status: :unprocessable_entity
					end
				rescue ActiveRecord::RecordNotFound
					render json: {status:'ERRO', message:'Erro ao atualizar contato! Contato não encontrado!'},status: :ok
				end	
			end

			private

			def contact_params
				params.permit(:nome, :email, :assunto)
			end

		end
	end
end