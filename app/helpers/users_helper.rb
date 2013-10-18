module UsersHelper
  def private_or_public(goal)
    if goal.is_private
      "Public"
    else
      "Private"
    end
  end
  def done_or_notdone(goal)
    if goal.complete
      "Not Done"
    else
      "Done"
    end
  end
end
