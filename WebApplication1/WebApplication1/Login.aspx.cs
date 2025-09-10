using System;
using System.Data.SqlClient;
using System.Web;
using System.Web.Configuration;

namespace WebApplication1
{
    public partial class Login : System.Web.UI.Page
    {
        string cs = WebConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Auto-fill username & password if cookies exist
            if (!IsPostBack)
            {
                if (Request.Cookies["Username"] != null && Request.Cookies["Password"] != null)
                {
                    string savedUser = Request.Cookies["Username"].Value;
                    string savedPass = Request.Cookies["Password"].Value;

                    // Fill fields
                    txtUsername.Text = savedUser;
                    txtPassword.Attributes["value"] = savedPass;
                    chkRemember.Checked = true;

                    // Show Welcome Back message
                    lblWelcomeBack.Text = "👋 Welcome back, " + savedUser + "!";
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT Role FROM Users WHERE Username=@u AND Password=@p";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@u", txtUsername.Text);
                cmd.Parameters.AddWithValue("@p", txtPassword.Text);

                con.Open();
                object roleObj = cmd.ExecuteScalar();
                con.Close();

                if (roleObj != null)
                {
                    string role = roleObj.ToString();
                    Session["Username"] = txtUsername.Text;
                    Session["Role"] = role;

                    // ✅ Only store cookies for Students (NOT Admins)
                    if (role == "Student")
                    {
                        if (chkRemember.Checked)
                        {
                            // Create cookies for 7 days
                            Response.Cookies["Username"].Value = txtUsername.Text;
                            Response.Cookies["Password"].Value = txtPassword.Text;
                            Response.Cookies["Username"].Expires = DateTime.Now.AddDays(7);
                            Response.Cookies["Password"].Expires = DateTime.Now.AddDays(7);
                        }
                        else
                        {
                            // Remove cookies
                            Response.Cookies["Username"].Expires = DateTime.Now.AddDays(-1);
                            Response.Cookies["Password"].Expires = DateTime.Now.AddDays(-1);
                        }
                    }

                    // Redirect based on role
                    if (role == "Admin")
                    {
                        Response.Redirect("AdminPanel.aspx");
                    }
                    else
                    {
                        Response.Redirect("WebForm1.aspx");
                    }
                }
                else
                {
                    lblMessage.Text = "Invalid Username or Password!";
                }
            }
        }
    }
}
