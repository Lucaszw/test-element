class StlSender < ActionMailer::Base
  default from: "noreply@lanilabs.com"
  
  def stl_attatchment_email(user, user_model)
  
    attachments['#{user_model.name}.stl'] = File.read('#{user_model.stlfile.url}')
    render :text => "print sent by : #{user.name}"
    mail(to: "lucas.zeer@gmail.com", subject: "PRINT for ID : #{user_model.id}") do |format|
      format.html {render text: "Here is your file."}
      format.text {render text: "Here is your file."}
    end
    
  end
  
end
