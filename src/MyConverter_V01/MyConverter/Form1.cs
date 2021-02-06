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

        bool CheckDecimalInput(string strDecimal)
        {
            // check for too large or too small
            if (Convert.ToInt64(strDecimal) > 2147483647) // or >= 2147483648 !!!
            {
                txtDecimal.Text = "decimal too large";
                return false;
            }
            else if(Convert.ToInt32(strDecimal)<0)
            {
                txtDecimal.Text = "negative not valid for other numbers";
                return false;
            }
            return true;
        }

        bool CheckBinaryInput(string strBinary)
        {
            // for negative: System.ArgumentException: 'String cannot contain a minus sign if the base is not 10.'
            // check first or too large check will fail
            if(strBinary.Substring(0,1)=="-")
            {
                txtBinary.Text = "binary cannot be negative";
                return false;
            }
            // check for too large or too small
            else if (Convert.ToInt64(strBinary,2) > 2147483647) // or >= 2147483648 !!!
            {
                txtBinary.Text = "binary number too large";
                return false;
            }
            
            return true;
        }
        bool CheckOctalInput(string strOctal)
        {
            // for negative: System.ArgumentException: 'String cannot contain a minus sign if the base is not 10.'
            if(strOctal.Substring(0, 1) == "-")
            {
                txtOctal.Text = "octal cannot be negative";
                return false;
            }
            // check for too large or too small
            else if (Convert.ToInt64(strOctal,8) > 2147483647) // or >= 2147483648 !!!
            {
                txtOctal.Text = "octal number too large";
                return false;
            }
            return true;

        }
        bool CheckHexInput(string strHex)
        {
            // for negative: System.ArgumentException: 'String cannot contain a minus sign if the base is not 10.'
            if (strHex.Substring(0, 1) == "-")
            {
                txtHex.Text = "hex cannot be negative";
                return false;
            }
            // check for too large or too small
            else if (Convert.ToInt64(strHex,16) > 2147483647) // or >= 2147483648 !!!
            {
                txtHex.Text = "hex number too large";
                return false;
            }
            return true;

        }
        private void btnDecimal_Click(object sender, EventArgs e)
        {

            string strDecimal = txtDecimal.Text; // make consistent with others

            if (CheckDecimalInput(strDecimal))
            {
                int myDec = Convert.ToInt32(strDecimal);
                ShowConversions(myDec);
            }
                
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnBinary_Click(object sender, EventArgs e)
        {
            string strBinary = txtBinary.Text;
            if (CheckBinaryInput(strBinary))
            {
                int myDec = Convert.ToInt32(strBinary, 2);
                ShowConversions(myDec);
            }
       }

        private void btnOctal_Click(object sender, EventArgs e)
        {
            string strOctal = txtOctal.Text;
            if (CheckOctalInput(strOctal))
            {
                int myDec = Convert.ToInt32(strOctal, 8);
                ShowConversions(myDec);
            }
            
        }

        private void btnHex_Click(object sender, EventArgs e)
        {
            string strHex = txtHex.Text;
            if (CheckHexInput(strHex))
            {
                int myDec = Convert.ToInt32(strHex, 16);
                ShowConversions(myDec);
            }

        }


    }
}
