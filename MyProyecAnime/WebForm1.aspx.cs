using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Xml;
using System.Xml.Xsl;

namespace MyProyecAnime
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public object Label1 { get; private set; }
        public string tipomenu = string.Empty;

        protected void Page_Load(object sender, EventArgs e) {
            lblresultado.Text = "";


            if (Request.QueryString["id"] == null)
            {
                tipomenu = "0";
            }
            else
            {
                tipomenu = Request.QueryString["id"].ToString();
            }

            TransFormarXML();

            
        }
        private void TransFormarXML()
        {
            string xmlPath = ConfigurationManager.AppSettings["FileServer"].ToString() + "xml/anime.xml";
            string xsltPath = ConfigurationManager.AppSettings["FileServer"].ToString() + "xslt/template.xslt";

            //leer
            XmlTextReader xmlTextReader = new XmlTextReader(xmlPath);

            //CONFIGURAR

            XmlUrlResolver xmlUrLResolver = new XmlUrlResolver();
            xmlUrLResolver.Credentials = CredentialCache.DefaultCredentials;

            XsltSettings settings = new XsltSettings(true, true);

            XslCompiledTransform xslt = new XslCompiledTransform();
            xslt.Load(xsltPath, settings, xmlUrLResolver);

            StringBuilder stringBuilder = new StringBuilder();
            TextWriter textWriter = new StringWriter(stringBuilder);

            XsltArgumentList xsltArgumentList = new XsltArgumentList();
            xsltArgumentList.AddParam("TipoMenu", "", tipomenu);

            xslt.Transform(xmlTextReader, xsltArgumentList, textWriter);

            string resultado = stringBuilder.ToString();

            Response.Write(resultado);


        }
    }
}
