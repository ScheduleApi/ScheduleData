using Dapper;
using General.Model;
using Microsoft.Extensions.Configuration;
using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;

namespace General.Utility
{
    public class Logger
    {
        private readonly IConfiguration _config;

        public Logger(IConfiguration config)
        {

            this._config = config;
        }

        public IDbConnection Connection
        {
            get
            {
                return new SqlConnection(_config.GetConnectionString("DbConnection"));
            }
        }

        public void WriteFunctionLog(string destinationFolder, string x , string functionName, string message, string ErrorSource)
        {
            if (Directory.Exists(destinationFolder))
            {
                string pathfile = destinationFolder + "Log_" + DateTime.Now.ToString("dd-MM-yyyy") + ".txt";
                if (File.Exists(pathfile))
                {

                    StreamWriter wr = File.AppendText(pathfile);
                    wr.WriteLine(DateTime.Now.ToString("dd-MMM-yyy hh:mm") + " - " + x + " == " + functionName + " == " + message);
                    wr.Close();
                }
                else
                {
                    File.Create(pathfile).Dispose();
                    StreamWriter wr = File.AppendText(pathfile);
                    wr.WriteLine(DateTime.Now.ToString("dd-MMM-yyy hh:mm") + " - " + x + " == " + functionName + " == " + message);
                    wr.Close();
                }


            }

            else
            {
                DirectoryInfo di = Directory.CreateDirectory(destinationFolder);
                string pathfile = destinationFolder + "Log_" + DateTime.Now.ToString("dd-MM-yyyy") + ".txt";
                if (File.Exists(pathfile))
                {
                    StreamWriter wr = File.AppendText(pathfile);
                    wr.WriteLine(DateTime.Now.ToString("dd-MMM-yyy hh:mm") + " - " + x + " == " + functionName + " == " + message);
                    wr.Close();
                }
                else
                {
                    File.Create(pathfile).Dispose();
                    StreamWriter wr = File.AppendText(pathfile);
                    wr.WriteLine(DateTime.Now.ToString("dd-MMM-yyy hh:mm") + " - " + x + " == " + functionName + " == " + message);
                    wr.Close();
                }
            }


            var data = new ErrorLogModel();
            using (IDbConnection conn = Connection)
            {
                var param = new DynamicParameters();
                param.Add("@ErrorSource", ErrorSource);
                param.Add("@ErrorMessage", message);
                param.Add("@FunctionName", functionName);


                data = conn.Query<ErrorLogModel>("sp_Tbl_Error_LogInsert", param,
                           commandType: CommandType.StoredProcedure).FirstOrDefault();

            }
        }
    }
}
