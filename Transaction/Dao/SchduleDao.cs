using Dapper;
using General.Model;
using General.Utility;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace Transaction.Dao
{
    public class SchduleDao
    {
        private readonly Logger _Logger;
        private readonly IConfiguration _config;

        public SchduleDao(IConfiguration config)
        {
            this._Logger = new Logger(config);
            this._config = config;
        }

        public IDbConnection Connection
        {
            get
            {
                return new SqlConnection(_config.GetConnectionString("DbConnection"));
            }
        }

        public IList<ScheduleModel> GetAllSchedule()
        {
            var data = new List<ScheduleModel>();
            using (IDbConnection conn = Connection)
            {
                var param = new DynamicParameters();
                param.Add("@Id", null);


                data = conn.Query<ScheduleModel>("sp_Tbl_Mst_ScheduleSelect", param,
                           commandType: CommandType.StoredProcedure).ToList();

            }

            return data;
        }

        public ScheduleModel CreateSchedule(ScheduleModel model)
        {
            var data = new ScheduleModel();

            using (IDbConnection conn = Connection)
            {
                var param = new DynamicParameters();
                param.Add("@Title", model.Title);
                param.Add("@StartDate", model.StartDate);
                param.Add("@EndDate", model.EndDate);
                param.Add("@Description", model.Description);
                data = conn.Query<ScheduleModel>("sp_Tbl_Mst_ScheduleInsert", param,
                           commandType: CommandType.StoredProcedure).FirstOrDefault();

            }
            return data;
        }


        public ScheduleModel UpdateSchedule(ScheduleModel model)
        {
            var data = new ScheduleModel();
            using (IDbConnection conn = Connection)
            {
                var param = new DynamicParameters();
                param.Add("@Id", model.Id);
                param.Add("@Title", model.Title);
                param.Add("@StartDate", model.StartDate);
                param.Add("@EndDate", model.EndDate);
                param.Add("@Expiry", model.Expiry);
                param.Add("@Description", model.Description);
                param.Add("@Complete", model.Complete);


                data = conn.Query<ScheduleModel>("sp_Tbl_Mst_ScheduleUpdate", param,
                           commandType: CommandType.StoredProcedure).FirstOrDefault();



            }

            return data;
        }

        public void RemoveSchedule(int Id)
        {

            using (IDbConnection conn = Connection)
            {
                var param = new DynamicParameters();
                param.Add("@Id", Id);

                conn.Execute("sp_Tbl_Mst_ScheduleDelete", param,
                             commandType: CommandType.StoredProcedure);

            }
        }

    }    
}
