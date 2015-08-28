class InboxController < ApplicationController
  include Mandrill::Rails::WebHookProcessor

  def handle_inbound(event_payload)

    opts = {
      message_id: event_payload.message_id,
      from: event_payload.user_email,
      to: event_payload.recipients,
      subject: msg['subject'],
      body: msg['raw_msg']
    }

    ActionMailer::base.mail(opts).deliver

  end
end
