﻿using akademik_ccdp.DAL;
using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace akademik_ccdp
{
    public partial class tambah_mahasiswa : System.Web.UI.Page
    {
        private DropDownList DropDownListProgram;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownListProgram_Init(object sender, EventArgs e) {
            DropDownListProgram = sender as DropDownList; 
        }

        protected void DetailsViewMahasiswa_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            var KodeProgram = Convert.ToString(DropDownListProgram.SelectedValue); e.Values["kode_program"] = KodeProgram;
        }

        protected void EntityDataSourceMahasiswa_ContextCreating(object sender, EntityDataSourceContextCreatingEventArgs e)
        {
            var db = new akademik_dbEntities1();
            e.Context = (db as IObjectContextAdapter).ObjectContext;
        }


        protected void EntityDataSourceProgram_ContextCreating(object sender, EntityDataSourceContextCreatingEventArgs e)
        {
            var db = new akademik_dbEntities1();
            e.Context = (db as IObjectContextAdapter).ObjectContext;
        }
    }
}