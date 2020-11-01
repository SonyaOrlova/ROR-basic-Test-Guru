class FeedbacksController < ApplicationController
  def new
    @feedback = current_user.feedbacks.new
  end

  def create
    @feedback = current_user.feedbacks.new(feedback_params)

    if @feedback.save
      redirect_to root_path, notice: t('.success')
    else
      render :new
    end
  end

  def feedback_params
    params.require(:feedback).permit(:body)
  end
end
