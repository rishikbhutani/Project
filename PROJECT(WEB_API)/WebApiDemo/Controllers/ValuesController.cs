using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebApiDemo.Models;


namespace WebApiDemo.Controllers
{
    
    public class ValuesController : ApiController
    {

        HREntities1 hr = new HREntities1();
        

        // GET api/values
        public IEnumerable<myprocone1_Result> Get()
        {
            
            return hr.myprocone1();
        }

        // GET api/values/5
        public myprocone_Result Get(int id)
        {
            return hr.myprocone(id).FirstOrDefault();
        }

        // POST api/values
        public void Post([FromBody]string value)
        {
        }

        // PUT api/values/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/values/5
        public void Delete(int id)
        {
        }
    }
}
