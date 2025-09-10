using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string cs = WebConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;
        // ✅ Page Load
        protected void Page_Load(object sender, EventArgs e)
        {
            // Redirect to login if session is empty
            if (Session["Username"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            // Load Labs only the first time page loads
            if (!IsPostBack)
            {
                LoadLabs();
            }
        }

        // ==============================
        // LABS SECTION
        // ==============================
        private void LoadLabs()
        {
            List<Lab> allLabs = new List<Lab>
            {
                // Semester 1
                new Lab { Title = "Structured Language Lab", Tool = "C", Description = "Learned basics of C programming: loops, functions, arrays." },

                // Semester 2
                new Lab { Title = "OOP Lab", Tool = "C++", Description = "Object-Oriented Programming concepts: classes, objects, inheritance." },

                // Semester 3
                new Lab { Title = "Microprocessor & Microcontroller Lab", Tool = "Assembly", Description = "Worked with 8085 microprocessor and assembly language programming." },
                new Lab { Title = "Data Structure Lab", Tool = "C++", Description = "Implemented stacks, queues, linked lists, trees." },
                new Lab { Title = "Computer Architecture Lab", Tool = "Simulation Tools", Description = "Simulated basic CPU operations and memory management." },

                // Semester 4
                new Lab { Title = "Algorithm Design Lab", Tool = "C++", Description = "Implemented sorting, searching, and graph algorithms." },
                new Lab { Title = "Android Studio Lab", Tool = "Java & Android Studio", Description = "Developed a Coffee Shop App with Firebase backend." },
                new Lab { Title = "Desktop Applications Lab", Tool = "C#", Description = "Created Windows Forms applications with GUI." },
                new Lab { Title = "Numerical Methods Lab", Tool = "MATLAB / C++", Description = "Implemented numerical solutions for mathematical problems." }
            };

            // Bind the data to the repeater
            LabsRepeater.DataSource = allLabs;
            LabsRepeater.DataBind();
        }

        // ==============================
        // CONTACT FORM - SAVE TO DATABASE
        // ==============================
        protected void btnSendMessage_Click(object sender, EventArgs e)
        {
            try
            {
                // Get connection string
                string cs = WebConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;

                using (SqlConnection con = new SqlConnection(cs))
                {
                    // SQL Query to insert message
                    string query = "INSERT INTO Messages (Name, Email, Message) VALUES (@Name, @Email, @Message)";
                    SqlCommand cmd = new SqlCommand(query, con);

                    // Parameters for security
                    cmd.Parameters.AddWithValue("@Name", txtName.Text);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@Message", txtMessage.Text);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }

                // Show confirmation message
                lblStatus.Text = "✅ Your message has been sent successfully!";
                lblStatus.ForeColor = System.Drawing.Color.LightGreen;

                // Clear form
                txtName.Text = "";
                txtEmail.Text = "";
                txtMessage.Text = "";
            }
            catch (Exception ex)
            {
                // Show error message
                lblStatus.Text = "❌ Error: " + ex.Message;
                lblStatus.ForeColor = System.Drawing.Color.Red;
            }
        }



        // 1️⃣ Load feedback dynamically from database
        private void LoadFeedback()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT Name, Message, CreatedAt FROM Feedback ORDER BY CreatedAt DESC";
                SqlCommand cmd = new SqlCommand(query, con);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                rptFeedback.DataSource = reader;
                rptFeedback.DataBind();
                con.Close();
            }
        }
        // 2️⃣ Submit new feedback to database
        protected void btnSubmitFeedback_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtFeedbackName.Text) && !string.IsNullOrEmpty(txtFeedbackMessage.Text))
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    string query = "INSERT INTO Feedback (Name, Message) VALUES (@Name, @Message)";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Name", txtFeedbackName.Text);
                    cmd.Parameters.AddWithValue("@Message", txtFeedbackMessage.Text);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                lblFeedbackStatus.Text = "Thank you for your feedback!";
                lblFeedbackStatus.ForeColor = System.Drawing.Color.LightGreen;

                // Clear the form fields
                txtFeedbackName.Text = "";
                txtFeedbackMessage.Text = "";

                // Refresh the feedback list
                LoadFeedback();
            }
            else
            {
                lblFeedbackStatus.Text = "Please fill in all fields!";
                lblFeedbackStatus.ForeColor = System.Drawing.Color.Red;
            }

        }




        }

    // ==============================
    // LAB CLASS - Represents Lab Info
    // ==============================
    public class Lab
    {
        public string Title { get; set; }
        public string Tool { get; set; }
        public string Description { get; set; }
    }
}
