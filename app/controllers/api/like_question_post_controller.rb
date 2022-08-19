class Api::LikeQuestionPostController < Api::ApiController
  
  def create

    @react = LikeQuestionPostCommand.new.execute(question_post_id: params[:question_post_id], user_id: params[:user_id])
    render status: 201, json: @react
  end

end