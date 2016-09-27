require 'sendgrid-ruby'
require 'pry'
include SendGrid
class SendgridMoka

  def initialize()
    @sendgrid_moka = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    @from = "no-replay@mokapos.com"
  end

  def test_email_sendgrid
    @sendgrid_moka.client.mail._("send").post(request_body: testEmailFormat("arip@mokapos.com", "test saja", @from, "test"))
  end
  
  private
  def testEmailFormat(to, subject, from_email, value)
     data = {
       personalizations: [
         {
           to: [
             {
               email: to
             }
           ],
           subject: subject,
           substitutions: {
             ":business_name"=>"Asem as",
             ":business_email"=>"larief@mokapos.com",
             ":business_phone"=>"0819102928293"
           }
         }
       ],
       from: {
         email: from_email
       },
       template_id: "70e21f64-8f83-4965-82c0-41b07a45077f"
     }
  end

end
