using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using JKPhoto.Models;

namespace JKPhoto.Controllers
{
    public class AccountController : Controller
    {
        [HttpPost]
        public ActionResult Login(string username, string password)
        {
            using (var jkData = new JKPhotoDataContext())
            {
                var userList = jkData.Users.Where(u => u.userName == username && u.password == password);
                if (userList.Count() > 0)
                {
                    var tkt = new FormsAuthenticationTicket(username, true, 240);
                    var cookiestr = FormsAuthentication.Encrypt(tkt);
                    var ck = new HttpCookie(FormsAuthentication.FormsCookieName, cookiestr);
                    ck.Expires = tkt.Expiration;
                    ck.Path = FormsAuthentication.FormsCookiePath;
                    Response.Cookies.Add(ck);
                }
            }
            return RedirectToAction("UserPortfolio", "Home");
        }

        public ActionResult LogOut()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Index", "Home");
        }

    }
}
