class ReactQuestionPostCommand
  @@array_user_like = []
  @@array_user_dislike = []
  
  def like(user_id:, question_id:)
    
    if @@array_user_like.include? user_id
      puts'Ação já realizada !'
    else
      if user_id != QuestionPost.find(question_id).user_id
        
        if QuestionPost.find(question_id).like == nil
          like = 0
          dislike = 0
        else
          like = QuestionPost.find(question_id).like
        end
        
        like += 1
        
        QuestionPost.find(question_id).update(like: like)
        
        if @@array_user_dislike.include? user_id
          dislike = QuestionPost.find(question_id).dislike
          dislike -= 1
          @@array_user_dislike.delete(user_id)
          QuestionPost.last.update(dislike: dislike)
        end
        @@array_user_like << user_id
      end
    end
  end

  def likes
    users_like = []
    @@array_user_like.each do |id|
      users_like << User.find(id)
    end
    return users_like
  end

  def removelike(user_id:, question_id:)
    
    if @@array_user_like.include? user_id

      like = QuestionPost.find(question_id).like

      like = like - 1
      
      @@array_user_like.delete(user_id)
      
      QuestionPost.find(question_id).update(like: like)
    end
  end

  def dislike(user_id:, question_id:)
    
    if @@array_user_dislike.include? user_id
      puts 'Ação já realizada !'
    else
      if user_id != QuestionPost.find(question_id).user_id

        
        if QuestionPost.last.dislike == nil
          dislike = 0
          like = 0
        else
          dislike = QuestionPost.last.dislike
        end
        
        dislike += 1
        
        QuestionPost.find(question_id).update(dislike: dislike)
        if @@array_user_like.include? user_id
          like = QuestionPost.find(question_id).like
          like -= 1
          @@array_user_like.delete(user_id)
          QuestionPost.last.update(like: like)
        end
        @@array_user_dislike << user_id
      end
    end
  end

  def dislikes
    users_dislike = []
    @@array_user_dislike.each do |id|
      users_dislike << User.find(id)
    end
    return users_dislike
  end

  def removedislike(user_id:, question_id:)
    
    if @@array_user_dislike.include? user_id

      dislike = QuestionPost.find(question_id).dislike

      dislike = dislike - 1
      
      @@array_user_dislike.delete(user_id)

      QuestionPost.find(question_id).update(dislike: dislike)
    end
  end
end