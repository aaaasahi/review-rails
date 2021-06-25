class Administrator::UsersController < ApplicationController
  
  def index
    @users = User.all
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name",
              template: "administrator/users/index.html.haml"
      end
    end
  end

end
