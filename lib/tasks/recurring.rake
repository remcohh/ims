namespace :recurring do
  desc "Recurring Email"
  task :init => :environment do
    # Delete any previously-scheduled recurring jobs
    Delayed::Job.where('(handler LIKE ?)', '--- !ruby/object:DailyEmailer%').destroy_all

    DailyEmailer.schedule!
  end

end
