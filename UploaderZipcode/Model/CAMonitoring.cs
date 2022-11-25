using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UploaderZipcode.Model
{
    public class CAMonitoring
    {
        public string UserCA { get; set; }
        public int MTDNew { get; set; }
        public int MTDReturn { get; set; }
        public int MTDCopy { get; set; }
        public int DailyNew { get; set; }
        public int DailyReturn { get; set; }
        public int DailyCopy { get; set; }
        public int DENew { get; set; }
        public int DEReturn { get; set; }
        public int DECopy { get; set; }
        public int ClaimedNew { get; set; }
        public int ClaimedReturn { get; set; }
        public int ClaimedCopy { get; set; }
        public int RtnSo { get; set; }
        public int RtnSvy { get; set; }
        public int Ach { get; set; }
        public decimal AchDec { get; set; }

    }
}