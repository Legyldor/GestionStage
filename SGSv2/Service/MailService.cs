using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;

namespace SGSv2.Service
{
    public class MailService
    {
        public void envoyerCourriel(String subject, String body, List<String> msgTo, List<String> msgCC, List<String> msgCCI)
        {
            MailMessage Mailmsg = new MailMessage();
            SmtpClient Smtp = new SmtpClient();

            Smtp.Host = Properties.Settings.Default.SMTPHost; //' définir SMTPHost dans les paramètres du projet
            Smtp.Port = Properties.Settings.Default.SMTPPort; //' définir SMTPPort dans les paramètres du projet

            Mailmsg.Subject = subject;
            Mailmsg.Body = body;
            Mailmsg.IsBodyHtml = true;
            Mailmsg.From = new MailAddress(Properties.Settings.Default.SMTPAccount); //' définir SMTPAccount dans les paramètres du projet

            // 'ajoute le(s) To
            foreach (String adress in msgTo)
            {
                Mailmsg.To.Add(new MailAddress(adress));
            }

            //'ajoute le(s) CC
            foreach (String adress in msgCC)
            {
                Mailmsg.CC.Add(new MailAddress(adress));
            }

            //'ajoute le(s) CCI
            foreach (String adress in msgCCI)
            {
                Mailmsg.Bcc.Add(new MailAddress(adress));
            }

            //'envoie le courriel
            Smtp.Send(Mailmsg);
        }
    }
}