using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication1
{
    public partial class Labs : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
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
                SqlCommand cmd = new SqlCommand("INSERT INTO Labs (Title, Description) VALUES (@t, @d)", con);
                cmd.Parameters.AddWithValue("@t", txtTitle.Text);
                cmd.Parameters.AddWithValue("@d", txtDesc.Text);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            LoadLabs();
            txtTitle.Text = "";
            txtDesc.Text = "";
        }

        protected void gvLabs_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "EditLab")
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("SELECT * FROM Labs WHERE Id=@id", con);
                    cmd.Parameters.AddWithValue("@id", id);
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        hfLabId.Value = dr["Id"].ToString();
                        txtTitle.Text = dr["Title"].ToString();
                        txtDesc.Text = dr["Description"].ToString();
                        btnAdd.Visible = false;
                        btnUpdate.Visible = true;
                        btnCancel.Visible = true;
                    }
                }
            }
            else if (e.CommandName == "DeleteLab")
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("DELETE FROM Labs WHERE Id=@id", con);
                    cmd.Parameters.AddWithValue("@id", id);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
                LoadLabs();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("UPDATE Labs SET Title=@t, Description=@d WHERE Id=@id", con);
                cmd.Parameters.AddWithValue("@t", txtTitle.Text);
                cmd.Parameters.AddWithValue("@d", txtDesc.Text);
                cmd.Parameters.AddWithValue("@id", hfLabId.Value);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            LoadLabs();
            txtTitle.Text = "";
            txtDesc.Text = "";
            btnAdd.Visible = true;
            btnUpdate.Visible = false;
            btnCancel.Visible = false;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtTitle.Text = "";
            txtDesc.Text = "";
            btnAdd.Visible = true;
            btnUpdate.Visible = false;
            btnCancel.Visible = false;
        }
    }
}
