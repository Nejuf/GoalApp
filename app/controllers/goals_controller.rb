class GoalsController < ApplicationController
  def create
    @goal = Goal.new(params[:goal])
    @goal.user_id = current_user.id

    if @goal.save
      redirect_to current_user
    else
      flash[:errors] = @goal.errors.full_messages
      redirect_to current_user
    end
  end

  def edit
    @goal = Goal.find_by_id(params[:id])
    render :edit
  end

  def update
    @goal = Goal.find_by_id(params[:id])

    if @goal.update_attributes(params[:goal])
      redirect_to current_user
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :edit
    end
  end

  def destroy
    @goal = Goal.find_by_id(params[:id])

    if @goal.destroy
      redirect_to current_user
    else
      flash[:errors] = ["Error destroying goal"]
      redirect_to current_user
    end
  end

  def toggle_private
    @goal = Goal.find(params[:id])
    @goal.is_private = !@goal.is_private

    if @goal.save
      redirect_to current_user
    else
      flash[:errors] = ["Error toggling private"]
      redirect_to current_user
    end
  end

  def toggle_done
    @goal = Goal.find(params[:id])
    @goal.complete = !@goal.complete

    if @goal.save
      redirect_to current_user
    else
      flash[:errors] = ["Error toggling completion"]
      redirect_to current_user
    end
  end
end
