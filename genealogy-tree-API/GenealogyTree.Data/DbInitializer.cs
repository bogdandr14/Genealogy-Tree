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
            // Look for any education levels.
            if (!context.EducationLevels.Any())
            {
                IEnumerable<EducationLevel> educationLevels = new List<EducationLevel>();

                string[] educationNames = Enum.GetNames(typeof(Domain.Enums.EducationLevel));

                foreach (var educationName in educationNames)
                {
                    educationLevels = educationLevels.Append(new EducationLevel { Name = educationName.ToUpper() });
                }

                context.AddRange(educationLevels);
            }

            if (!context.Religions.Any())
            {
                IEnumerable<Religion> religions = new List<Religion>();
                string[] religionNames = Enum.GetNames(typeof(Domain.Enums.Religions));

                foreach (var religionName in religionNames)
                {
                    religions = religions.Append(new Religion { Name = religionName });
                }

                context.AddRange(religions);
            }

            if (!context.Nationalities.Any())
            {
                IEnumerable<Nationality> nationalities = new List<Nationality>();

                string[] nationalitiesNames = Enum.GetNames(typeof(Domain.Enums.Nationalities));

                foreach (var nationalityName in nationalitiesNames)
                {
                    nationalities = nationalities.Append(new Nationality { Name = nationalityName });
                }

                context.AddRange(nationalities);
            }

            context.SaveChanges();
        }
    }
}
