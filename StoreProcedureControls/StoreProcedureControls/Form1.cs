using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace StoreProcedureControls
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=**********;Initial Catalog=STOCKTRACKINGSYSTEM;User ID=********;Password=********");
            

            SqlCommand cmd = new SqlCommand("[dbo].SALES ", con);
            cmd.Parameters.AddWithValue("@PRODUCTID", Convert.ToInt32(textBox1.Text));
            cmd.Parameters.AddWithValue("@CUSTOMERID", Convert.ToInt32(textBox2.Text));
            cmd.Parameters.AddWithValue("@DEALERID", Convert.ToInt32(textBox3.Text));
            cmd.Parameters.AddWithValue("@PIECE", Convert.ToInt32(textBox4.Text));
            cmd.Parameters.AddWithValue("@EMPLOYEEID", Convert.ToInt32(textBox5.Text));
            cmd.CommandType = CommandType.StoredProcedure;


            con.Open();
            try
            {
                MessageBox.Show("Connection is succesfull.");
                cmd.ExecuteNonQuery();
            }
            catch (Exception exception)
            {

                MessageBox.Show(exception.Message);
            }
            


        }
    }
}
