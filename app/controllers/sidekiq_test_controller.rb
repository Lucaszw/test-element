class SidekiqTestController < ApplicationController
  include ActionController::Live
  def test_page
    @lastMessage = Message.last
  end
  
  def getRequest
    @message = Message.create(:text => params[:data])
    #HardWorker.perform_async(params[:data])    
    #render :json => {:data => params[:data]}
  end
  
  def events
  
    response.headers['Content-Type'] = 'text/event-stream'
    start = Time.zone.now
    10.times do |n|
    Message.uncached do 
        Message.where('created_at > ?',start).each do |message|
          response.stream.write "data:#{message.to_json} \n\n"
          start = message.created_at
        end
      end
      sleep 2
    end
    
    ensure
      response.stream.close
  end
  
end
