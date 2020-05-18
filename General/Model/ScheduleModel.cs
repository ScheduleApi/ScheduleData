using System;
using System.Collections.Generic;
using System.Text;

namespace General.Model
{
    public class ScheduleModel
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public int Expiry { get; set; }
        public string Description { get; set; }
        public int Complete { get; set; }
    }
}
