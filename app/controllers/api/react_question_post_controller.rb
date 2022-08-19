class Api::ReactQuestionPostController < Api::ApiController

  def index
    
    @react = ListAllReactQuestionPostCommandHandler.new.execute
    render status: 201, json: @react
  end

  def destroy
    
    @react = React.find(params[:id])
    RemoveReactQuestionPostCommandHandler.new(question_post_id: @react.question_post_id, user_id: @react.user_id).execute
    render status: 201, json: @react
  end
end