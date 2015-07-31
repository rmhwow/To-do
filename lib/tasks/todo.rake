namespace :todo do
  desc "Delete items older than seven days"
  task delete_tasks: :environment do
    Task.where("created_at <= ?", Time.now - 7.days).destroy_all
  end

end
