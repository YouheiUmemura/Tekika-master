class NotificationsController < ApplicationController
  def index
    @notifications = current_user.passive_notifications.page(params[:page]).per(20)
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end

  # def visitor
  #   @visitor = notification.visitor(visitor_id: user.id)
  # end
end
