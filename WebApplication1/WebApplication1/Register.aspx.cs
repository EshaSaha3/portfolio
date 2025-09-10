using System;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication1
{
    public partial class Register : System.Web.UI.Page
    {
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "INSERT INTO Users (Username, Password, Role) VALUES (@Username, @Password, 'Student')";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Username", txtUsername.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim()); // ⚠ Plain text for now

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            // Show success message
            lblMessage.Text = "Registration successful! Redirecting to login...";

            // Clear fields
            txtUsername.Text = "";
            txtPassword.Text = "";

            // Redirect to login after 2 seconds
            Response.AddHeader("REFRESH", "2;URL=Login.aspx");
        }
    }
}
