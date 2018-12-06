using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GameFilmNation
{
    public partial class frmRegisterAccount : Form
    {
        frmMainMenu parent;

        public frmRegisterAccount()
        {
            InitializeComponent();
        }

        public frmRegisterAccount(frmMainMenu Parent)
        {
            InitializeComponent();
            parent = Parent;

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void frmRegisterAccount_Load(object sender, EventArgs e)
        {
            txtAccId.Text = Account.nextAccountId().ToString("0000");
        }

        private void btnBack_Click(object sender, EventArgs e)
        {
            this.Close();

            parent.Show();
        }

        private void btnRegMem_Click(object sender, EventArgs e)
        {
            //Validate Data
           

            //For DateSysTime
            string d = DateTime.Now.ToString("d-MMM-yyyy");
           

            //Save Data to register Account file
            Account RegAcc = new Account();
          

            RegAcc.setAccountId(Convert.ToInt32(txtAccId.Text));
            RegAcc.setName(txtName.Text);
            RegAcc.setType("M");

            RegAcc.setDoB(dtpDateOfBirth.Text);
            RegAcc.setPassword(txtPassword.Text);
            RegAcc.setStatus("A");
            RegAcc.setEmail(txtEmail.Text);
            RegAcc.setUsername(txtUserName.Text);
            RegAcc.setMemberLevel("Copper");
            RegAcc.setSavedSysTime(d);

            //insert into Account Table
            RegAcc.setRegisterAccount();

            //ResetUI
            txtAccId.Text = "";
            txtName.Text = "";
            txtEmail.Text = "";
            txtUserName.Text = "";
            txtPassword.Text = "";
            txtAccId.Text = Account.nextAccountId().ToString("0000");

            txtName.Focus();


        }

        private void txtAccId_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
