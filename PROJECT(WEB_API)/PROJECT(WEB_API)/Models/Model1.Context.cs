﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PROJECT_WEB_API_.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class HREntities : DbContext
    {
        public HREntities()
            : base("name=HREntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
    
        public virtual ObjectResult<myproc_Result> myproc()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<myproc_Result>("myproc");
        }
    
        public virtual ObjectResult<myprocone1_Result> myprocone1()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<myprocone1_Result>("myprocone1");
        }
    
        public virtual ObjectResult<myprocone_Result> myprocone(Nullable<int> id)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("id", id) :
                new ObjectParameter("id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<myprocone_Result>("myprocone", idParameter);
        }
    }
}