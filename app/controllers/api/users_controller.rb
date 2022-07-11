class Api::UsersController < Api::ApiController
  def create
    user = CreateUserCommandHandler.new.execute(params[:name], params[:birthdate],
       params[:email], params[:gender], params[:street], params[:number], params[:city], params[:country])
    binding.pry
    render status: 201, json: user
  end

  private
  def user_params
    params.require(:user).permit(:name, :birthdate, :email, :gender)
  end
end