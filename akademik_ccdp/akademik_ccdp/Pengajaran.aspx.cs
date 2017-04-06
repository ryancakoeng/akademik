using akademik_ccdp.DAL;
using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace akademik_ccdp
{
    public partial class Pengajaran : System.Web.UI.Page
    {
        private TextBox NamaMatakuliahTextBox;
        protected void Page_Load(object sender, EventArgs e)
        {
            string username = Session["username"] as string;

            if (String.IsNullOrEmpty(username))
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void EntityDataSourcePengajaran_ContextCreating(object sender, EntityDataSourceContextCreatingEventArgs e)
        {
            var db = new akademik_dbEntities1();
            e.Context = (db as IObjectContextAdapter).ObjectContext;
        }

        protected void GridViewPengajaran_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void NamaMataKuliahTextBox_Init(object sender, EventArgs e) 
        {
            NamaMatakuliahTextBox = sender as TextBox; 
        }

        protected void GridViewPengajaran_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            using (var context = new akademik_dbEntities1())
            {
                var kode_pengajaranBeingUpdated = Convert.ToInt32(e.Keys[0]);
                var NamaMataKuliah2 = (from o in context.pengajarans where o.kode_pengajaran == kode_pengajaranBeingUpdated select o).FirstOrDefault();
                try
                {
                    //MENGUBAH FIELD NAMA_MATAKULIAH
                    if (String.IsNullOrWhiteSpace(NamaMatakuliahTextBox.Text) == false)
                    {
                        context.matakuliahs.Add(new matakuliah { kode_matakuliah = NamaMataKuliah2.kode_matakuliah, kode_program = null, nama_matakuliah = NamaMatakuliahTextBox.Text, sks = 0, semester = 0 });

                    }
                    else
                    {
                        var NamaMataKuliah3 = (from n in context.matakuliahs where n.kode_matakuliah == NamaMataKuliah2.kode_matakuliah select n).FirstOrDefault();
                        NamaMataKuliah3.nama_matakuliah = NamaMatakuliahTextBox.Text;
                    }
                    context.SaveChanges();
                }
                catch (Exception)
                {
                    e.Cancel = true;
                    ErrorMsgLabel.Visible = true;
                    ErrorMsgLabel.Text = "Updated Failed.";
                    //Add code to log the Error.
                }
            }
        }

        protected void EntityDataSourceMatakuliah_ContextCreating(object sender, EntityDataSourceContextCreatingEventArgs e)
        {
            var db = new akademik_dbEntities1();
            e.Context = (db as IObjectContextAdapter).ObjectContext;
        }

        protected void EntityDataSourceInstruktur_Selected(object sender, EntityDataSourceSelectedEventArgs e)
        {

        }

        protected void EntityDataSourceInstruktur_ContextCreating(object sender, EntityDataSourceContextCreatingEventArgs e)
        {
            var db = new akademik_dbEntities1();
            e.Context = (db as IObjectContextAdapter).ObjectContext;
        }
    }
    
}