//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace akademik_ccdp.DAL
{
    using System;
    using System.Collections.Generic;
    
    public partial class nilai
    {
        public int kode_nilai { get; set; }
        public string nim { get; set; }
        public int kode_pengajaran { get; set; }
        public Nullable<byte> nilai1 { get; set; }
    
        public virtual mahasiswa mahasiswa { get; set; }
        public virtual pengajaran pengajaran { get; set; }
    }
}