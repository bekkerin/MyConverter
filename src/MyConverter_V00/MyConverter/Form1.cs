using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MyConverter
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            ShowConversions(0);
        }

        void ShowConversions(int myDec)
        {
            txtDecimal.Text = Convert.ToString(myDec);
            txtBinary.Text = Convert.ToString(myDec, 2); 
            txtOctal.Text = Convert.ToString(myDec, 8);
            txtHex.Text = Convert.ToString(myDec, 16).ToUpper();
        }
        private void btnDecimal_Click(object sender, EventArgs e)
        {
            int myDec = Convert.ToInt32(txtDecimal.Text);
            ShowConversions(myDec);
           
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnBinary_Click(object sender, EventArgs e)
        {
            string strBinary = txtBinary.Text;
            int myDec = Convert.ToInt32(strBinary, 2);
            ShowConversions(myDec);
        }

        private void btnOctal_Click(object sender, EventArgs e)
        {
            string strOctal = txtOctal.Text;
            int myDec = Convert.ToInt32(strOctal, 8);
            ShowConversions(myDec);
        }

        private void btnHex_Click(object sender, EventArgs e)
        {
            string strHex = txtHex.Text;
            int myDec = Convert.ToInt32(strHex, 16);
            ShowConversions(myDec);
        }
    }
}
