class CreateQuestionPostCommand
  @like_user = 0
  @removelike_user = 0
  @dislike_user = 0
  @removedislike_user = 0

  def initialize(question:)
    
    QuestionPost.new(question: question, user_id: User.last.id).save
  end

  def like(user_id:)

    if @like_user != user_id
      if user_id != QuestionPost.last.user_id

        if QuestionPost.last.like == nil
          like = 0
          dislike = 0
        else
          like = QuestionPost.last.like
          dislike = QuestionPost.last.dislike
        end

        like += 1

        @like_user = user_id
        QuestionPost.last.update(like: like)
        if @dislike_user == @like_user
          if dislike >= 1
            dislike -= 1
          end
          QuestionPost.last.update(dislike: dislike)
        end
      end
    end
  end
  def removelike(user_id:)

    if user_id == @like_user and @removelike_user != user_id

      like = QuestionPost.last.like

      if like >= 1
        like = like - 1
      end
        
      @removelike_user = user_id
      QuestionPost.last.update(like: like)
    end
  end


  def dislike(user_id:)

    if @dislike_user != user_id
      if user_id != QuestionPost.last.user_id

        if QuestionPost.last.dislike == nil
          dislike = 0
          like = 0
        else
          dislike = QuestionPost.last.dislike
          like = QuestionPost.last.like
        end

        dislike += 1

        @dislike_user = user_id
        QuestionPost.last.update(dislike: dislike)
        if @like_user == @dislike_user
          if like >= 1
            like -= 1
          end
          QuestionPost.last.update(like: like)
        end
      end
    end
  end


  def removedislike(user_id:)

    if user_id == @dislike_user and @removedislike_user != user_id

      dislike = QuestionPost.last.like

      if dislike >= 1
        dislike -= 1
      end
        
      @removedislike_user = user_id
      QuestionPost.last.update(dislike: dislike)
    end
  end
end