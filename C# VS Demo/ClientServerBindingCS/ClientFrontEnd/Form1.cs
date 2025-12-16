using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ClientFrontEnd
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void GetData_Click(object sender, EventArgs e)
        {
            LnkRecordInfo myData = new LnkRecordInfo();

            Client.Client myPgm = new Client.Client();

            myData.LnkRecordNum = RecordNum.Text;

            myPgm.Client(myData);

            FirstName.Text = myData.LnkFirstname;

            LastName.Text = myData.LnkLastname;

        }
       
    }
}
