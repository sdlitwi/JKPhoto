using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using JKPhoto.Models;
using System.Web.Security;

namespace JKPhoto.Controllers
{
    public class HomeController : Controller
    {
        private JKPhotoDataContext jkdata = new JKPhotoDataContext();
        //
        // GET: /Home/

        public HomeController()
        {
            jkdata = new JKPhotoDataContext();
        }

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Contact()
        {
            return View();
        }

        //returns an album of photos
        public ActionResult Album(int albumID = 0)
        {
            var album = from a in jkdata.Albums where a.id == albumID && a.deleted==false select a;

            if(album.Count() > 0){
            ViewBag.Name = album.FirstOrDefault().name.Trim();
            IEnumerable<JKPhoto.Models.Photo> photos = from p in jkdata.Photos where p.albumID == albumID && p.deleted == false select p;
            return View(photos);
            }
            return null;
        }

        public ActionResult Portfolio(string updatephotos = "false")
        {
            if (updatephotos.Equals("true"))
            {
                PortfolioDataService.UpdateAlbums();
            }

            IEnumerable<JKPhoto.Models.Album> albums = from a in jkdata.Albums where a.deleted == false && a.isPublic == true select a;
            return View(albums);

        }

        [Authorize]
        public ActionResult UserPortfolio()
        {
            var user = jkdata.Users.ToList().Find(u => u.userName == User.Identity.Name);

            IEnumerable<JKPhoto.Models.Album> albums = 
                from a in jkdata.Albums 
                join ua in jkdata.UserAlbums 
                on a.id equals ua.albumId 
                where ua.userId == user.id  
                && a.deleted == false select a;

            return View("Portfolio",albums);
        }
    }
}
