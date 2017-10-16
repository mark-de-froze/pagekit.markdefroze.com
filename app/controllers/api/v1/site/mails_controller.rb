class Api::V1::Site::MailsController < ApiController

  def create
    mail_params = params.permit(:message, :from_email, :from_name, :api_key)
    mail_params[:subject] = 'Call back ' + mail_params[:message]
    mail_params[:status] = :unread

    @mail = Site::Mail.new(mail_params)

    if @mail.save
      json_response({ message: 'RecordCreate' }, :created)
    else
      json_response({ message: 'RecordInvalid' }, :upgrade_required)
    end
  end
end