using GenealogyTree.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;

namespace GenealogyTree.Data
{
    public static class DbInitializer
    {
        public static void Initialize(GenealogyTreeDbContext context)
        {
            // Look for any students.
            if (!context.EducationLevels.Any())
            {
                var educationLevels = new EducationLevel[]
                {
                new EducationLevel {
                    Name = "KINDERGARTEN" },
                new EducationLevel {
                    Name = "PRIMARY" },
                new EducationLevel {
                    Name = "GYMNASIUM" },
                new EducationLevel {
                    Name = "HIGHSCOOL" },
                new EducationLevel {
                    Name = "POSTSECONDARY" },
                new EducationLevel {
                    Name = "FACULTY" },
                new EducationLevel {
                    Name = "MASTERS" },
                new EducationLevel {
                    Name = "DOCTORATE" },
                };

                context.AddRange(educationLevels);
            }

            if (!context.Genders.Any())
            {
                var genders = new Gender[]
                {
                new Gender {
                    Name = "MALE" },
                new Gender {
                    Name = "FEMALE" },
                new Gender {
                    Name = "OTHER" },
                };

                context.AddRange(genders);
            }

            if (!context.Religions.Any())
            {
                var religions = new Religion[]
                {
                new Religion {
                    Name = "CHRISTIANITY" },
                new Religion {
                    Name = "ISLAM" },
                new Religion {
                    Name = "AGNOSTIC" },
                new Religion {
                    Name = "ATHEIST" },
                new Religion {
                    Name = "HINDUISM" },
                new Religion {
                    Name = "BUDDHISM" },
                new Religion {
                    Name = "CHINESE_TRADITIONAL" },
                new Religion {
                    Name = "ETHNIC" },
                new Religion {
                    Name = "AFRICAN_TRADITIONAL" },
                new Religion {
                    Name = "SIKHISM" },
                new Religion {
                    Name = "SPIRITISM" },
                new Religion {
                    Name = "JUDAISM" },
                new Religion {
                    Name = "BAHAI" },
                new Religion {
                    Name = "JAINISM" },
                new Religion {
                    Name = "SHINTO" },
                new Religion {
                    Name = "CAO_DAI" },
                new Religion {
                    Name = "ZOROASTRIANISM" },
                new Religion {
                    Name = "TENRIKYO" },
                new Religion {
                    Name = "ANIMISM" },
                new Religion {
                    Name = "NEO-PAGANISM" },
                new Religion {
                    Name = "UNITARIAN_UNIVERSALISM" },
                new Religion {
                    Name = "RASTAFARI" },
                new Religion {
                    Name = "OTHER" },
                };

                context.AddRange(religions);
            }

            if (!context.Nationalities.Any())
            {
                var nationalities = new Nationality[]
                {
                new Nationality {
                    Name = "Danish" },
                new Nationality {
                    Name = "British" },
                new Nationality {
                    Name = "Estonian" },
                new Nationality {
                    Name = "Finnish" },
                new Nationality {
                    Name = "Icelandic" },
                new Nationality {
                    Name = "Irish" },
                new Nationality {
                    Name = "Latvian" },
                new Nationality {
                    Name = "Lithuanian" },
                new Nationality {
                    Name = "Northern_Irish" },
                new Nationality {
                    Name = "Norwegian" },
                new Nationality {
                    Name = "Scottish" },
                new Nationality {
                    Name = "Swedish" },
                new Nationality {
                    Name = "Welsh" },
                new Nationality {
                    Name = "Austrian" },
                new Nationality {
                    Name = "Belgian" },
                new Nationality {
                    Name = "French" },
                new Nationality {
                    Name = "German" },
                new Nationality {
                    Name = "Dutch" },
                new Nationality {
                    Name = "Swiss" },
                new Nationality {
                    Name = "Albanian" },
                new Nationality {
                    Name = "Croatian" },
                new Nationality {
                    Name = "Cypriot" },
                new Nationality {
                    Name = "Greek" },
                 new Nationality {
                    Name = "Italian" },
                new Nationality {
                    Name = "Portuguese" },
                new Nationality {
                    Name = "Serbian" },
                new Nationality {
                    Name = "Slovenian" },
                new Nationality {
                    Name = "Spanish" },
                new Nationality {
                    Name = "Belarusian" },
                new Nationality {
                    Name = "Bulgarian" },
                new Nationality {
                    Name = "Czech" },
                new Nationality {
                    Name = "Hungarian" },
                new Nationality {
                    Name = "Polish" },
                new Nationality {
                    Name = "Romanian" },
                new Nationality {
                    Name = "Russian" },
                new Nationality {
                    Name = "Slovakian" },
                new Nationality {
                    Name = "Ukrainian" },
                };

                context.AddRange(nationalities);
            }
            context.SaveChanges();
        }
    }
}
