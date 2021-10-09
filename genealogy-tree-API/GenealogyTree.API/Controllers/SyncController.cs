using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GenealogyTree.API.Controllers
{
    public class SyncController : Controller
    {
        // GET: SyncController
        public ActionResult Index()
        {
            return View();
        }

        // GET: SyncController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: SyncController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: SyncController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: SyncController/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: SyncController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: SyncController/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: SyncController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
    }
}
