using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using JKPhoto.Objects;
using JKPhoto.Models;

namespace JKPhoto.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/

        public ActionResult Index()
        {
            PortfolioWorker.UpdateAlbums();
            return View();
        }

        public ActionResult Contact()
        {
            return View();
        }

        //returns an album of photos
        public ActionResult Album(int albumID = 0)
        {
            var jkdata = new JKPhotoDataContext();

            var album = from a in jkdata.Albums where a.id == albumID && a.deleted==false select a;

            if(album.Count() > 0){
            ViewBag.Name = album.FirstOrDefault().name.Trim();
            IEnumerable<JKPhoto.Models.Photo> photos = from p in jkdata.Photos where p.albumID == albumID && p.deleted == false select p;
            return View(photos);
            }
            return null;
        }

        public ActionResult Portfolio()
        {
            var jkdata = new JKPhotoDataContext();

            IEnumerable<JKPhoto.Models.Album> albums = from a in jkdata.Albums where a.deleted == false select a;

            return View(albums);

        }
    }
}
