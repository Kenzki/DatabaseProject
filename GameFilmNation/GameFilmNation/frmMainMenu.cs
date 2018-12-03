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
    public partial class frmMainMenu : Form
    {
        public frmMainMenu()
        {
            InitializeComponent();
        }

        private void btnRegAccount_Click(object sender, EventArgs e)
        {
            this.Hide();

            frmRegisterAccount regAccount = new frmRegisterAccount(this);
            regAccount.Show();
        }
    }
}
