class FeedbacksController < ApplicationController
  def new
    @feedback = current_user.feedbacks.new
  end

  def create
    @feedback = current_user.feedbacks.new(feedback_params)

    if @feedback.save
      FeedbacksMailer.send_feedback(@feedback).deliver_now

      redirect_to root_path, notice: t('.success')
    else
      render :new
    end
  end

  def feedback_params
    params.require(:feedback).permit(:body)
  end
end
