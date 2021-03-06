class TagsController < ApplicationController

def index
	@tags=Tag.all
end

def show
	@tag=Tag.find(params[:id])
end

before_filter :require_login, only: [:destroy]

def require_login
	unless current_user
		redirect_to login_path
	end
end

def destroy
	@tag=Tag.find(params[:id])
	@tag.destroy

	flash.notice="Tag '#{@tag.name}' Deleted!"

	redirect_to action: "index"
end

end
