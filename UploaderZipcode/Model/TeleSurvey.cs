using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UploaderZipcode.Model
{
    public class TeleSurvey
    {
        public string error { get; set; }
        public int? id { get; set; }
        public string svyr { get; set; }
        public int? Total { get; set; }
        public int? Submit { get; set; }
        public int? Pending { get; set; }
        public int? SixMnts { get; set; }
        public int? OneEightM { get; set; }
        public int? PrcntgSix { get; set; }
        public int? PrctgOneEight { get; set; }
        public int? StdActvty { get; set; }
        public int? AssignDate { get; set; }
        public int? SLAStd { get; set; }
        public int? Achive180 { get; set; }
        public int? SLAB { get; set; }
        public int? prctg { get; set; }
        public int? SLANOW { get; set; }
        public int? SLANOWPRCNTG { get; set; }
        public int? EIGHTYMINUTES { get; set; }
        public int? done180 { get; set; }
        public int? prctgSLA { get; set; }
        public string SLAToday { get; set; }
        public string stdPrdctvty { get; set; }
        public string stdMinSLA { get; set; }
        public string AchiveBEFORE { get; set; }
        public string SLABefore { get; set; }
        public string AchiveNOW { get; set; }
    }
}