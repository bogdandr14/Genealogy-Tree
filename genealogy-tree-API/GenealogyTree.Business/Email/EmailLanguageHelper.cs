namespace GenealogyTree.Business.Email
{
    public static class EmailLanguageHelper
    {
        const string ReportedByEng = "Reported by";
        const string ReportedByRo = "Creat de";

        const string SupportNoteEng = "Our support team will use the email provided above to contact you in order to solve your request or to give updates.";
        const string SupportNoteRo = "Echipa noastră va folosi e-mail-ul oferit mai sus pentru a lua legatura cu dumneavoastră în vederea soluţionării cererii sau a primi actualizări.";

        const string ReplyNoteEng = "You can reply to this email if you want to offer additional information.";
        const string ReplyNoteRo = "Puteţi răspunde acestui e-mail dacă doriţi să oferiţi informaţii adiţionale.";

        public static EmailDescription GetEmailDescription(string lang)
        {

            switch (lang)
            {
                case "ro":
                    return new EmailDescription()
                    {
                        ReportedBy = ReportedByRo,
                        ReplyNote = ReplyNoteRo,
                        SupportNote = SupportNoteRo
                    };
                case "eng":
                default:
                    return new EmailDescription()
                    {
                        ReportedBy = ReportedByEng,
                        ReplyNote = ReplyNoteEng,
                        SupportNote = SupportNoteEng
                    };
            }

        }
    }
}
