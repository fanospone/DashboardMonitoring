using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UploaderZipcode.Model
{
    public class barChart
    {
        public string Area { get; set; }
        public int RangeNew { get; set; }
        public int RangeReturn { get; set; }
        public int RangeCopy { get; set; }
        
        public string Date { get; set; }
        public int? SLA { get; set; }
    }
}