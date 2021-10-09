using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GenealogyTree.API.Controllers
{
    public class TreeController : Controller
    {
        // GET: TreeController
        public ActionResult Index()
        {
            return View();
        }

        // GET: TreeController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: TreeController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: TreeController/Create
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

        // GET: TreeController/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: TreeController/Edit/5
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

        // GET: TreeController/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: TreeController/Delete/5
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
