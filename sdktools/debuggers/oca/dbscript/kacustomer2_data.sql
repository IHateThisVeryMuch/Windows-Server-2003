/*************************************************************/
/*                                                           */
/* Abstract:                                                 */
/*	Online Crash Analysis Customer Database Data         */
/*	SQL Scripts                                          */
/*                                                           */
/* Revision History:                                         */
/*    05/07/01  ChrisDec       Create Initial Script         */
/*                                                           */
/*************************************************************/

PRINT '**** OCA Data SQL Script Begin ****'
GO

/*************************************************************/

INSERT INTO Response (Type, Lang, Description, Subject)
VALUES (1,'USA','The initial analysis of this Stop error report is complete.

To view the analysis results, select the link under Analysis Status for this ErrorID on the Microsoft Windows Online Crash Analysis (https://oca.microsoft.com/secure/status.asp) Web site.

Thank you,
Microsoft Windows Online Crash Analysis','Analysis of error report [ErrorID: %s] is complete.')
GO

INSERT INTO Response (Type, Lang, Description, Subject)
VALUES (2,'USA','We have some initial information about this Stop error.

The initial analysis of your error report has been completed by the Windows Online Crash Analysis Web site.  We were unable to automatically match your error report to a previously identified crash signature, so we cannot offer you a specific solution for this problem at this time.  We will continue to research your error report, and will notify you via email if we discover anything new about your report.  To view the initial analysis results, select the Status link for this ErrorID on the Windows Online Crash Analysis (https://oca.microsoft.com/secure/status.asp) Web site.

Thank you,
Microsoft Windows Online Crash Analysis','Analysis of error report [ErrorID: %s] is complete.')
GO

INSERT INTO Response (Type, Lang, Description, Subject)
VALUES (3,'USA','We have discovered additional information about this Stop error.

To view the new information, select the link under Analysis Status for this Type on the Microsoft Windows Online Crash Analysis (https://oca.microsoft.com/secure/status.asp) Web site.

Thank you,
Microsoft Windows Online Crash Analysis','New information is available for error report [Type: %d].')
GO
INSERT INTO Response (Type, Lang, Description, Subject)
VALUES (4,'USA','Thank you for your submission to the Windows Online Crash Analysis Web site. Unfortunately, we were unable to process this error report. The possible causes include:

- Our service was unable to retrieve debug symbols from your error report. This condition usually occurs when an early pre-release version of the operating system is running.

- The small memory dump file  was corrupted while it was being generated and is unreadable by our Web site. When a Stop error occurs, the operating system cannot function normally. In this state, the system generates a small memory dump file that can be submitted for analysis. Sometimes the system cannot generate the small memory dump file correctly, and therefore we cannot analyze the file to determine the cause of the problem. The small memory dump file is affected by problems involving physical memory, the hard disk, or drive controllers. 

- The file was not successfully uploaded to the Windows Online Crash Analysis Web site. 

Your report is extremely important to us. If you would like to resubmit it to the Windows Online Crash Analysis Web site, we will try to process it again.

If you need urgent support for this Stop error, please review support options on the Microsoft Support Web site (http://support.microsoft.com/directory/).
   
Although we were unable to offer a solution for this error report, all information submitted to Microsoft is reviewed and analyzed to further improve the quality and reliability of Windows. 

Thank you,
Microsoft Windows Online Crash Analysis','Unable to process error report [ErrorID: %s].')
GO
INSERT INTO Response (Type, Lang, Description, Subject)
VALUES (16,'USA','Thank you for submitting your transaction to the Microsoft Corporate Error Reporting Web site. To check the analysis status of your transaction, visit the corporate status page at http://oca.microsoft.com.

During high volumn periods, some reports may not get processed right away. If issues persist, please contact oca@microsoft.com. 

Thank You,
Windows Online Crash Analysis','Analysis of Corporate Error Reporting transaction: %s has completed.')
GO 

INSERT INTO Response (Type, Lang, Description, Subject)
VALUES(8,'USA','We were unable to process this error report. The error report you uploaded is a 64-bit file and cannot be processed by Windows Online Crash Analysis at this time. However, we are currently working to implement this functionality.  

Thank you,
Microsoft Windows Online Crash Analysis','Unable to process this error report [ErrorID: %s ]')
GO

PRINT 'English Mail Responses Added'
GO

/*************************************************************/

INSERT INTO Response (Type, Lang, Description, Subject)
VALUES (1,'JPN','このイベント レポートの、既存データとの照合が終了いたしました。

解析結果は、オンライン クラッシュ ダンプ解析サービス Web サイト (https://ocajapan.rte.microsoft.com/secure/status.asp) の該当イベント ID のステータス リンクからご覧頂けます。 

ご利用頂きありがとうございました。
オンライン クラッシュダンプ解析サービス','イベント レポート [ErrorID: %s] の、既存データとの照合が終了いたしました。')
GO
INSERT INTO Response (Type, Lang, Description, Subject)
VALUES (2,'JPN','既存データと照合した結果、このイベント レポートについて情報があります。

お客様のイベント レポートの、既存データとの照合が終了いたしました。お客様のイベント レポートが以前確認されたクラッシュの特徴と自動的に一致しなかったため、現時点ではこの問題に対する固有の解決策をご提示できませんが、引き続き調査いたします。お客様のレポートに関する新しい情報が見つかりましたら、E-メールにてご連絡させていただきます。既存データとの照合結果を参照する場合には、オンライン クラッシュ ダンプ解析サービス Web サイト (https://ocajapan.rte.microsoft.com/secure/status.asp) の該当イベント ID のステータス リンクからご覧頂けます。 

ご利用頂きありがとうございました。
オンライン クラッシュダンプ解析サービス','イベント レポート [ErrorID: %s] の、既存データとの照合が終了いたしました。')
GO
INSERT INTO Response (Type, Lang, Description, Subject)
VALUES (3,'JPN','既存データと照合した結果、このイベント レポートについて情報があります。

情報を参照するには、オンライン クラッシュ ダンプ解析サービス Web サイト (https://ocajapan.rte.microsoft.com/secure/status.asp) の該当イベント ID のステータス リンクからご覧ください。 

ご利用頂きありがとうございました。
オンライン クラッシュダンプ解析サービス','イベント レポート [Type: %d] の、既存データとの照合が終了いたしました。')
GO
INSERT INTO Response (Type, Lang, Description, Subject)
VALUES (4,'JPN','このイベント レポートを処理できませんでした。レポートの解析ができない場合には、以下の理由が考えられます。
 
- お客様のエラー レポートのデバッグ シンボルの確認に失敗しました。オペレーティング システムがプレリリース版の可能性があります。
- エラー レポートが作成中に破損したため、Web サイトはこのレポートを読むことができません。
- ダンプ ファイルの内容が、ファイルのアップロードまたは解析中に破損しました。
- Microsoft のデータベースを更新中に問題が生じました。

ご利用頂きありがとうございました。
オンライン クラッシュダンプ解析サービス','イベント レポート [ErrorID: %s] を処理できませんでした。')
GO
INSERT INTO Response (Type, Lang, Description, Subject)
VALUES (16,'JPN','