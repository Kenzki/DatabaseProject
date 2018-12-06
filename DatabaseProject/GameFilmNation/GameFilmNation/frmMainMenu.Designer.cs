namespace GameFilmNation
{
    partial class frmMainMenu
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.btnRegAccount = new System.Windows.Forms.Button();
            this.btnLogin = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btnRegAccount
            // 
            this.btnRegAccount.Location = new System.Drawing.Point(115, 52);
            this.btnRegAccount.Name = "btnRegAccount";
            this.btnRegAccount.Size = new System.Drawing.Size(127, 23);
            this.btnRegAccount.TabIndex = 0;
            this.btnRegAccount.Text = "Register Account";
            this.btnRegAccount.UseVisualStyleBackColor = true;
            this.btnRegAccount.Click += new System.EventHandler(this.btnRegAccount_Click);
            // 
            // btnLogin
            // 
            this.btnLogin.Location = new System.Drawing.Point(115, 100);
            this.btnLogin.Name = "btnLogin";
            this.btnLogin.Size = new System.Drawing.Size(127, 23);
            this.btnLogin.TabIndex = 1;
            this.btnLogin.Text = "Login";
            this.btnLogin.UseVisualStyleBackColor = true;
            // 
            // frmMainMenu
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(368, 356);
            this.Controls.Add(this.btnLogin);
            this.Controls.Add(this.btnRegAccount);
            this.Name = "frmMainMenu";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Game Film Nation";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnRegAccount;
        private System.Windows.Forms.Button btnLogin;
    }
}

