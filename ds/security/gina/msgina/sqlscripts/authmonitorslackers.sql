USE Winlogon

DECLARE @crlf nvarchar(2)
SET @crlf = CHAR(13) + CHAR(10)

DECLARE @MessageBody nvarchar(4000)
SET @MessageBody = "If you have trouble with your card or your reader and" + @crlf +
                   "can't logon please send email to the alias smcaft." + @crlf +
                   @crlf +
                   "If you think that logon takes very long using smart cards," + @crlf +
                   "welcome aboard, we think that too. We're working on it..." + @crlf +
                   @crlf + 
                   "Anyway, please use your card whenever you can." + @crlf +
                   @crlf +
                   "Thanks," + @crlf +
                   "The Smart Card Team"

DECLARE @User nvarchar(64), @stUserlist nvarchar(4000)
SET @stUserlist = ""

DECLARE @Checkdate datetime, @OneMonth datetime
SET @Checkdate = DATEADD(day, -8, GETDATE())
SET @OneMonth = DATEADD(day, -28, GETDATE())

--
--
--

DECLARE UserCursor CURSOR FOR
    SELECT DISTINCT USERNAME
    FROM AuthMonitor
    WHERE CARD <> ""
    AND TIMESTAMP > @OneMonth

OPEN UserCursor
FETCH NEXT FROM UserCursor
INTO @User

DECLARE @bSendmail int
SET @bSendmail = 1

WHILE @@FETCH_STATUS = 0
BEGIN

    SELECT USERNAME
    FROM AuthMonitor
    WHERE TIMESTAMP > @Checkdate
    AND USERNAME = @User
    AND CARD <> ""

    IF @@ROWCOUNT = 0
    BEGIN
        SET @stUserlist = @stUserlist + @User + @crlf

        IF @bSendMail <> 0    
            EXEC master.dbo.xp_sendmail 
                 @recipients = @User, 
                 @message =  @MessageBody,
                 @subject = 'You have not used your smart card in a while...'
    END

    FETCH NEXT FROM UserCursor
    INTO @User
END

CLOSE UserCursor
DEALLOCATE UserCursor

SET @MessageBody = "Smart Card Slackers" + @crlf + 
                   "-------------------" + @crlf + 
                   @stUserlist

IF @bSendmail <> 0
    EXEC master.dbo.xp_sendmail 
         @recipients = 'smcaft', 
         @message =  @MessageBody,
         @subject = 'Smart Card Slackers'
    ELSE 
         PRINT @MessageBody
GO