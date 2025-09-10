using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class AdminPanel : System.Web.UI.Page
    {
        string cs = WebConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // ✅ Security: Only Admin can access this page
            if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                LoadLabs();
            }
        }

        void LoadLabs()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Labs", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvLabs.DataSource = dt;
                gvLabs.DataBind();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "INSERT INTO Labs (Title, Description) VALUES (@title, @desc)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@title", txtTitle.Text);
                cmd.Parameters.AddWithValue("@desc", txtDesc.Text);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            txtTitle.Text = "";
            txtDesc.Text = "";
            LoadLabs();
        }

        protected void gvLabs_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            gvLabs.EditIndex = e.NewEditIndex;
            LoadLabs();
        }

        protected void gvLabs_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvLabs.Rows[e.RowIndex];
            int id = Convert.ToInt32(gvLabs.DataKeys[e.RowIndex].Value);
            string title = ((TextBox)row.Cells[1].Controls[0]).Text;
            string desc = ((TextBox)row.Cells[2].Controls[0]).Text;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "UPDATE Labs SET Title=@title, Description=@desc WHERE Id=@id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@title", title);
                cmd.Parameters.AddWithValue("@desc", desc);
                cmd.Parameters.AddWithValue("@id", id);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            gvLabs.EditIndex = -1;
            LoadLabs();
        }

        protected void gvLabs_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            gvLabs.EditIndex = -1;
            LoadLabs();
        }

        protected void gvLabs_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvLabs.DataKeys[e.RowIndex].Value);

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "DELETE FROM Labs WHERE Id=@id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@id", id);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            LoadLabs();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
    }
}
