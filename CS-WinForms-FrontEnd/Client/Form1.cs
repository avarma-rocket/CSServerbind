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

            // Create a myData object to store data from LnkRecordInfo section from Client.cbl  
            LnkRecordInfo myData = new LnkRecordInfo();

            // myPgm object of the Client.cbl program that calls the native cobol program

            Client.Client myPgm = new Client.Client();

            myData.LnkRecordNum = RecordNum.Text;

            myPgm.Client(myData);

            // set the firstname and lastname text area's in the C# WPF to the updated LnkFirstame/lastname from Client.cbl 

            FirstName.Text = myData.LnkFirstname;

            LastName.Text = myData.LnkLastname;

        }

       
    }
}
