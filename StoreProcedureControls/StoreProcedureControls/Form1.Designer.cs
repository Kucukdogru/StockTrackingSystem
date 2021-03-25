
namespace StoreProcedureControls
{
    partial class Form1
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
            this.PRODUCTID = new System.Windows.Forms.Label();
            this.CUSTOMERID = new System.Windows.Forms.Label();
            this.DEALERID = new System.Windows.Forms.Label();
            this.PIECE = new System.Windows.Forms.Label();
            this.EMPLOYEEID = new System.Windows.Forms.Label();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.textBox2 = new System.Windows.Forms.TextBox();
            this.textBox3 = new System.Windows.Forms.TextBox();
            this.textBox4 = new System.Windows.Forms.TextBox();
            this.textBox5 = new System.Windows.Forms.TextBox();
            this.button1 = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // PRODUCTID
            // 
            this.PRODUCTID.AutoSize = true;
            this.PRODUCTID.Location = new System.Drawing.Point(46, 77);
            this.PRODUCTID.Name = "PRODUCTID";
            this.PRODUCTID.Size = new System.Drawing.Size(71, 13);
            this.PRODUCTID.TabIndex = 0;
            this.PRODUCTID.Text = "PRODUCTID";
            // 
            // CUSTOMERID
            // 
            this.CUSTOMERID.AutoSize = true;
            this.CUSTOMERID.Location = new System.Drawing.Point(38, 116);
            this.CUSTOMERID.Name = "CUSTOMERID";
            this.CUSTOMERID.Size = new System.Drawing.Size(79, 13);
            this.CUSTOMERID.TabIndex = 1;
            this.CUSTOMERID.Text = "CUSTOMERID";
            // 
            // DEALERID
            // 
            this.DEALERID.AutoSize = true;
            this.DEALERID.Location = new System.Drawing.Point(56, 155);
            this.DEALERID.Name = "DEALERID";
            this.DEALERID.Size = new System.Drawing.Size(61, 13);
            this.DEALERID.TabIndex = 2;
            this.DEALERID.Text = "DEALERID";
            // 
            // PIECE
            // 
            this.PIECE.AutoSize = true;
            this.PIECE.Location = new System.Drawing.Point(83, 193);
            this.PIECE.Name = "PIECE";
            this.PIECE.Size = new System.Drawing.Size(38, 13);
            this.PIECE.TabIndex = 3;
            this.PIECE.Text = "PIECE";
            // 
            // EMPLOYEEID
            // 
            this.EMPLOYEEID.AutoSize = true;
            this.EMPLOYEEID.Location = new System.Drawing.Point(45, 227);
            this.EMPLOYEEID.Name = "EMPLOYEEID";
            this.EMPLOYEEID.Size = new System.Drawing.Size(76, 13);
            this.EMPLOYEEID.TabIndex = 4;
            this.EMPLOYEEID.Text = "EMPLOYEEID";
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(147, 74);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(100, 20);
            this.textBox1.TabIndex = 5;
            // 
            // textBox2
            // 
            this.textBox2.Location = new System.Drawing.Point(147, 109);
            this.textBox2.Name = "textBox2";
            this.textBox2.Size = new System.Drawing.Size(100, 20);
            this.textBox2.TabIndex = 6;
            // 
            // textBox3
            // 
            this.textBox3.Location = new System.Drawing.Point(147, 148);
            this.textBox3.Name = "textBox3";
            this.textBox3.Size = new System.Drawing.Size(100, 20);
            this.textBox3.TabIndex = 7;
            // 
            // textBox4
            // 
            this.textBox4.Location = new System.Drawing.Point(147, 185);
            this.textBox4.Name = "textBox4";
            this.textBox4.Size = new System.Drawing.Size(100, 20);
            this.textBox4.TabIndex = 8;
            // 
            // textBox5
            // 
            this.textBox5.Location = new System.Drawing.Point(147, 220);
            this.textBox5.Name = "textBox5";
            this.textBox5.Size = new System.Drawing.Size(100, 20);
            this.textBox5.TabIndex = 9;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(118, 289);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(160, 30);
            this.button1.TabIndex = 10;
            this.button1.Text = "EXEC PROCEDURE";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.textBox5);
            this.Controls.Add(this.textBox4);
            this.Controls.Add(this.textBox3);
            this.Controls.Add(this.textBox2);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.EMPLOYEEID);
            this.Controls.Add(this.PIECE);
            this.Controls.Add(this.DEALERID);
            this.Controls.Add(this.CUSTOMERID);
            this.Controls.Add(this.PRODUCTID);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label PRODUCTID;
        private System.Windows.Forms.Label CUSTOMERID;
        private System.Windows.Forms.Label DEALERID;
        private System.Windows.Forms.Label PIECE;
        private System.Windows.Forms.Label EMPLOYEEID;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.TextBox textBox2;
        private System.Windows.Forms.TextBox textBox3;
        private System.Windows.Forms.TextBox textBox4;
        private System.Windows.Forms.TextBox textBox5;
        private System.Windows.Forms.Button button1;
    }
}

