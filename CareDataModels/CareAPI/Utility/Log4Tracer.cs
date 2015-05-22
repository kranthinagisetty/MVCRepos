using log4net;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http.Tracing;

namespace CareAPI.Utility
{
    public class Log4Tracer:ITraceWriter
    {
        private static readonly ILog log = log4net.LogManager.GetLogger(typeof(Log4Tracer));
        
        public void Trace(System.Net.Http.HttpRequestMessage request, string category, TraceLevel level, Action<TraceRecord> traceAction)
        {
            TraceRecord rec = new TraceRecord(request, category, level);
            traceAction(rec);
            WriteLog(rec);
        }

        public void WriteLog(TraceRecord rec)
        {
            String strLog = string.Format("{0};{1};{2};{3}", rec.Category, rec.Operator, rec.Operation, rec.Message);
            log.Info(strLog);
        }
    }
}