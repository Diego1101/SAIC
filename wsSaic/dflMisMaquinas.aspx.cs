using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnGenerar_Click(object sender, EventArgs e)
    {
        Button r = (Button)sender;

        Response.Write("<script language ='javascript'>alert('"+r.CommandArgument.ToString()+"')</script>");

    }
}