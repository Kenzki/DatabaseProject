using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Oracle.ManagedDataAccess.Client;

namespace GameFilmNation
{
    class Account
    {
        //instance variables
        private int accountId;
        private string name;
        private string type;
        private string DoB;
        private string password;
        private string status;
        private string email;
        private string username;
        private string memberlevel;
        private string savedSysTime;

        //no argument constructor
        public Account()
        {
            accountId = 0;
            name = "";
            type = "";
            DoB = "";
            password = "";
            status = "";
            email = "";
            username = "";
            memberlevel = "";
            savedSysTime = "";

        }

        //Getters
        public void setAccountId(int accountId)
        {
            this.accountId = accountId;
        }

        public void setName(String name)
        {
            this.name = name;
        }

        public void setType(String type)
        {
            this.type = type;
        }

        public void setDoB(String DoB)
        {
            this.DoB = DoB;
        }

        public void setPassword(String password)
        {
            this.password = password;
        }

        public void setStatus(String status)
        {
            this.status = status;
        }

        public void setEmail(String email)
        {
            this.email = email;
        }

        public void setUsername(String username)
        {
            this.username = username;
        }

        public void setMemberLevel(String memberlevel)
        {
            this.memberlevel = memberlevel;
        }

        public void setSavedSysTime(String savedsystime)
        {
            this.savedSysTime = savedsystime;
        }

        //Getters

        public int getAccountId()
        {
            return accountId;
        }

        public string getName()
        {
            return name;
       
        }
        public string getType()
        {
            return type;

        }
        public string getDoB()
        {
            return DoB;

        }
        public string getPassword()
        {
            return password;

        }
        public string getStatus()
        {
            return status;

        }
        public string getEmail()
        {
            return email;

        }
        public string getUsername()
        {
            return username;

        }
        public string getMemberLevel()
        {
            return memberlevel;

        }

        public string getSavedSysTime()
        {
            return savedSysTime;

        }

        // A static method to get data
        public static DataSet getAccounts(DataSet DS)
        {
            OracleConnection conn = new OracleConnection(DBConnect.oradb);

            //connection name conn.Open();
            String strSQL = "SELECT * FROM Account ORDER BY AccountId";
            OracleCommand cmd = new OracleCommand(strSQL, conn);

            //cmd.CommandType = CommandType.Text;
            OracleDataAdapter ds = new OracleDataAdapter(cmd);

            ds.Fill(DS, "ss");

            conn.Close();

            return DS;
        }

        public void setRegisterAccount()
        {
            //connect to database
            OracleConnection myConn = new OracleConnection(DBConnect.oradb);
            myConn.Open();

            //Define SQL query to INSERT DVD record
            String strSQL = "INSERT INTO Members VALUES(" + this.accountId.ToString() + ",'" + this.name + "','" + this.type + "','" + this.DoB + "','" + this.password + "','" + this.status + "','" + this.email + "','" + this.username + "','" + this.memberlevel + "','" + this.savedSysTime + "')";

            //Execute the command
            OracleCommand cmd = new OracleCommand(strSQL, myConn);
            cmd.ExecuteNonQuery();

            //close DB connection
            myConn.Close();

        }
    }
}
