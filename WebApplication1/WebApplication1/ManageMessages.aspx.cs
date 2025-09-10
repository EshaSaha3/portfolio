using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace WebApplication1
{
    public partial class ManageMessages : System.Web.UI.Page
    {
        string cs = WebConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadMessages();
            }
        }

        void LoadMessages()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Messages ORDER BY CreatedAt DESC", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvMessages.DataSource = dt;
                gvMessages.DataBind();
            }
        }
    }
}
