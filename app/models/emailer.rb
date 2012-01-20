class Emailer < ActionMailer::Base
  # gem 'whenever', :require => false
  def contact(recipient, subject, message, sent_at = Time.now)
    @subject = subject
    @recipients = recipient
    @from = 'cshamith@sparksupport.com'
    @sent_on = sent_at
    @body["title"] = 'This is title'
    @body["email"] = 'cshamith@sparksupport.com'
    @body["message"] = 'message'
    @headers = {}
    #redirect_to :controller=>"manage",:action=>"sendmail"
    #ManageController. sendmail
    @a=User.last
    render :text=>@a.id
  end
  def self.s1
    @event=Event.new
    @event.save
  end
  def self.dailymail
    time=Time.now
    @data1=EmployeeEvent.find(:first,:conditions=>["day=? and month=? ",time.day,time.month])
    @count=EmployeeEvent.count(:conditions=>["day=? and month=? ",time.day,time.month])
    @count_mail=Configuration.count
    @data=Configuration.all
     if @count_mail>0
         if @count>0
           @data.each do |a|
             Emailer.deliver_dailymailsend(a.email)
           end
         else
           return
         end
     else
       return
     end
    
  end

  def dailymailsend(recipient)
    time=Time.now
    @data1=EmployeeEvent.find(:all,:conditions=>["day=? and month=? ",time.day,time.month])
    #@body["a"]='sss'
    #@data= @data1.id
    @subject = "'Today's Event notification."
    @recipients = recipient
    @from = 'cshamith@sparksupport.com'
    @sent_on = Time.now
    @body["title"] = 'This is title'
    @body["email"] = 'cshamith@sparksupport.com'
    @body["message"] = 'message'
    @headers = {}
    @content_type = "text/html"
    #redirect_to :controller=>"manage",:action=>"sendmail"
    #ManageController. sendmail
    @a=User.last
    render :text=>@a.id
  end
  def self.weeklymail
    @count=Configuration.count
    if @count>0
      @data=Configuration.all
      @data.each do |a|
        Emailer.deliver_weeklymailsend(a.email)
      end
      
    else
      return
    end

  end
  def weeklymailsend(recipient)
    @data=EmployeeEvent.find_by_sql("SELECT *FROM employee_events
                                    WHERE DAY = DAY( now( ) )
                                    AND MONTH = MONTH( now( ) ) union all
                                    SELECT *
                                    FROM employee_events
                                    WHERE DAY = DAY( DATE_ADD( DATE( now( ) ) , INTERVAL 1 DAY ) )
                                    AND MONTH = MONTH(DATE_ADD( DATE( now( ) ) , INTERVAL 1 DAY ) )
                                    union all
                                    SELECT *
                                    FROM employee_events
                                    WHERE DAY = DAY( DATE_ADD( DATE( now( ) ) , INTERVAL 2 DAY ) )
                                    AND MONTH = MONTH(DATE_ADD( DATE( now( ) ) , INTERVAL 2 DAY ) )
                                    union all
                                    SELECT *
                                    FROM employee_events
                                    WHERE DAY = DAY( DATE_ADD( DATE( now( ) ) , INTERVAL 3 DAY ) )
                                    AND MONTH = MONTH(DATE_ADD( DATE( now( ) ) , INTERVAL 3 DAY ) )
                                    union all
                                    SELECT *
                                    FROM employee_events
                                    WHERE DAY = DAY( DATE_ADD( DATE( now( ) ) , INTERVAL 4 DAY ) )
                                    AND MONTH = MONTH(DATE_ADD( DATE( now( ) ) , INTERVAL 4 DAY ) )
                                    union all
                                    SELECT *
                                    FROM employee_events
                                    WHERE DAY = DAY( DATE_ADD( DATE( now( ) ) , INTERVAL 5 DAY ) )
                                    AND MONTH = MONTH(DATE_ADD( DATE( now( ) ) , INTERVAL 5 DAY ) )
                                    union all
                                    SELECT *
                                    FROM employee_events
                                    WHERE DAY = DAY( DATE_ADD( DATE( now( ) ) , INTERVAL 6 DAY ) )
                                    AND MONTH = MONTH(DATE_ADD( DATE( now( ) ) , INTERVAL 6 DAY ) )
                                    union all
                                    SELECT *
                                    FROM employee_events
                                    WHERE DAY = DAY( DATE_ADD( DATE( now( ) ) , INTERVAL 7 DAY ) )
                                    AND MONTH = MONTH(DATE_ADD( DATE( now( ) ) , INTERVAL 7 DAY ) )")
    @subject = "Event notification."
    @recipients = recipient
    @from = 'cshamith@sparksupport.com'
    @headers = {}
    @content_type = "text/html"
  end
end
