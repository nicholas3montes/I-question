class Api::UsersController < Api::ApiController
  def create
    user = CreateUserCommandHandler.new.execute(name:params[:name], birthdate:params[:birthdate],
       email:params[:email], gender:params[:gender], street:params[:street], number:params[:number], city:params[:city], country:params[:country])
    render status: 201, json: user
  end

  private
  def user_params
    params.require(:user).permit(:name, :birthdate, :email, :gender)
  end
end