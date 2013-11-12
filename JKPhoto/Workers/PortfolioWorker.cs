using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Web;
using JKPhoto.Models;
using System.Web.Hosting;
using System.Drawing;

namespace JKPhoto.Workers
{
    public class PortfolioWorker
    {
        // check for new directories and add them to the Albums table. 
        public static void UpdateAlbums()
        {
            var data = new JKPhotoDataContext();

            var path = Path.Combine(HostingEnvironment.ApplicationPhysicalPath, "Portfolio");
            var directories = Directory.GetDirectories(path);

            foreach (string dir in directories)
            {
                Album albumToUpdate = new Album();
                var dirName = dir.Substring(dir.LastIndexOf("\\") + 1);

                //sloppy, but fine for now since the number of directories is small
                var albums = from album in data.Albums where album.name.ToLower() == dirName.ToLower() select album;

                //if album does not exist, create it
                if (albums.Count().Equals(0))
                {

                    var name = char.ToUpper(dirName[0]) + dirName.Substring(1).ToLower();
                    albumToUpdate.name = name;

                    data.Albums.InsertOnSubmit(albumToUpdate);
                    data.SubmitChanges();

                    UpdatePhotos(albumToUpdate.name.Trim(), albumToUpdate.id);
                }
                else
                {
                    albumToUpdate = albums.FirstOrDefault();
                    albumToUpdate.deleted = false;
                    data.SubmitChanges();

                    UpdatePhotos(albumToUpdate.name.Trim(), albumToUpdate.id);
                }

                RemoveAlbums();
            }
        }

        public static void UpdatePhotos(string dirName, int dirID)
        {
            var data = new JKPhotoDataContext();

            var path = Path.Combine(HostingEnvironment.ApplicationPhysicalPath + "Portfolio", dirName);

            if (Directory.Exists(path))
            {
                var files = Directory.GetFiles(path);

                foreach (string file in files)
                {
                    Photo photoToUpdate = new Photo();
                    if (Path.GetExtension(file) == ".jpg" || Path.GetExtension(file) == ".jpeg")
                    {
                        var img = new Bitmap(file);

                        var fileName = file.Substring(file.LastIndexOf("\\") + 1).ToLower();

                        //sloppy, but fine for now since the number of photos is small
                        var photoFile = from photo in data.Photos where photo.fileName == fileName && photo.albumID==dirID select photo;

                        //if photo does not exist, create it
                        if (photoFile.Count().Equals(0))
                        {
                            photoToUpdate.fileName = fileName;
                            photoToUpdate.albumID = dirID;
                            photoToUpdate.height = img.Height;
                            photoToUpdate.width = img.Width;

                            data.Photos.InsertOnSubmit(photoToUpdate);
                            data.SubmitChanges();
                        }
                        else
                        {
                            photoToUpdate = photoFile.FirstOrDefault();
                            photoToUpdate.deleted = false;
                            photoToUpdate.height = img.Height;
                            photoToUpdate.width = img.Width;
                            data.SubmitChanges();
                        }
                        img.Dispose();
                    }
                }
                RemovePhotos(dirName, dirID);
            }

        }

        public static void RemovePhotos(string dirName, int dirID)
        {
            var data = new JKPhotoDataContext();

            var path = Path.Combine(HostingEnvironment.ApplicationPhysicalPath + "Portfolio", dirName);
            var photos = Directory.GetFiles(path);
            var dirPhotos = new List<string>();
            var dbPhotos = from p in data.Photos where p.albumID == dirID select p;

            foreach (var photo in photos)
            {
                var fileName = photo.Substring(photo.LastIndexOf("\\") + 1).ToLower();
                dirPhotos.Add(fileName);
            }

            foreach (var photo in dbPhotos)
            {
                //if the album does not exist, remove it
                if (!dirPhotos.Contains(photo.fileName))
                {
                    photo.deleted = true;
                }
            }
            data.SubmitChanges();
        }

        public static void RemoveAlbums()
        {
            var data = new JKPhotoDataContext();

            var path = Path.Combine(HostingEnvironment.ApplicationPhysicalPath, "Portfolio");
            var directories = Directory.GetDirectories(path);
            var dirAlbums = new List<string>();
            var dbAlbums = data.Albums;

            foreach (var dir in directories)
            {
                var dirName = dir.Substring(dir.LastIndexOf("\\") + 1);
                dirName = char.ToUpper(dirName[0]) + dirName.Substring(1).ToLower();
                dirAlbums.Add(dirName);
            }
            foreach (var album in dbAlbums)
            {
                //if the album does not exist, remove it
                if (!dirAlbums.Contains(album.name.Trim()))
                {
                    album.deleted = true;
                    var dbPhotos = from p in data.Photos where p.albumID == album.id select p;
                    foreach (var photo in dbPhotos)
                    {
                        photo.deleted = true;
                    }
                }
            }
            data.SubmitChanges();

        }
    }
}