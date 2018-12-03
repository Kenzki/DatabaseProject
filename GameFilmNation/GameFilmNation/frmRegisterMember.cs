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
           
        }

        private void btnBack_Click(object sender, EventArgs e)
        {
            this.Close();

            parent.Show();
        }
    }
}
