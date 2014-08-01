class HardWorker
  include Sidekiq::Worker
  

  def perform
      puts "I was called?"
  end
  
end