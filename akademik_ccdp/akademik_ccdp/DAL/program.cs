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
    
    public partial class program
    {
        public program()
        {
            this.mahasiswas = new HashSet<mahasiswa>();
            this.matakuliahs = new HashSet<matakuliah>();
        }
    
        public string kode_program { get; set; }
        public string nama_program { get; set; }
    
        public virtual ICollection<mahasiswa> mahasiswas { get; set; }
        public virtual ICollection<matakuliah> matakuliahs { get; set; }
    }
}