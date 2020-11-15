class Admin::BadgesController < Admin::BaseController
  before_action :badge, only: [:edit, :update, :destroy]

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badges_path, notice: t('.done', badge: @badge.title)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path, notice: t('.done', badge: @badge.title)
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    
    redirect_to admin_badges_path, notice: t('.done', badge: @badge.title)
  end

  private

  def badge
    @badge = Badge.find(params[:id]) if params[:id]
  end

  def badge_params
    params.require(:badge).permit(:title, :icon_url, :rule_type, :rule_value)
  end
end
