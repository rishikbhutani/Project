using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using PROJECT_WEB_API_.Models;

namespace PROJECT_WEB_API_.Controllers
{
    public class ValuesController : ApiController
    {
        // GET api/values
        public IEnumerable<myproc_Result> Get()
        {
            HREntities hr = new HREntities();
            return hr.myproc();
        }

        // GET api/values/5
        public string Get(int id)
        {
            return "value";
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
