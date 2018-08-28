using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ToDoMVC.Models;
using ToDoMVC.ViewModels;

namespace ToDoMVC.Controllers
{
	[Authorize]
	public class HomeController : Controller
	{
		private ToDoEntities entities = new ToDoEntities();

		// GET: /Home/
		public ActionResult Index()
		{
			return View(buildData());
		}


		// GET: /Home/RO
		public ActionResult RO()
		{
			return View(buildData());
		}


		// GET: /Home/Text
		public ActionResult Text()
		{
			return View(buildData());
		}


		private HomeIndexVM buildData()
		{
			HomeIndexVM vm = new HomeIndexVM();
			int userID = 0;
			switch (User.Identity.Name)
			{
				case "Devin":
					userID = 1;
					break;
				case "Andrea":
					userID = 2;
					break;
				default:
					RedirectToAction("Error", "Error with User Identity.");
					break;
			}

			var lists = entities.Lists.Where(i => i.UserID == userID || i.UserID == 3).OrderBy(i => i.ListOrder);
			vm.Lists = lists.ToList();

			vm.ListItems = entities.ListItems.Join(
					lists,
					i => i.ListID,
					l => l.ID,
					(listItem, list) => new { ListItem = listItem, UserID = list.UserID } )
					.OrderBy(i => i.ListItem.Priority)
					.ThenBy(i => i.ListItem.Text)
					.Select(li => li.ListItem)
					.ToList();
			vm.TimeFrames = entities.TimeFrames.ToArray();
			vm.Colors = new Color[]
				{
					Color.Transparent,
					Color.Red,
					Color.Orange,
					Color.Yellow,
					Color.Lime,
					Color.Green,
					Color.Cyan,
					Color.Blue,
					Color.Violet,
					Color.Purple,
					Color.White,
					Color.LightGray,
					Color.Gray,
				};
			return vm;
		}


		[HttpPost]
		public ActionResult Edit(int ID, int? itemPriority, string itemText, string btnUpdate, string btnDelete)
		{
			if (btnDelete != null)
			{
				entities.DeleteObject(entities.ListItems.Where(i => i.ID == ID).First());
				entities.SaveChanges();

				return RedirectToAction("Index");
			}

			ListItem listItem = entities.ListItems.Where(i => i.ID == ID).First();
			listItem.Priority = itemPriority.Value;
			listItem.Text = itemText;
			entities.SaveChanges();
			entities.ObjectStateManager.ChangeObjectState(listItem, EntityState.Modified);

			return RedirectToAction("Index");
		}

		[HttpPost]
		public ActionResult Add(int? listID, int? itemPriority, string itemText)
		{
			ListItem listItem = new ListItem()
			{
				ListID = listID.Value,
				Priority = itemPriority.Value,
				Text = itemText,
			};

			entities.ListItems.AddObject(listItem);
			entities.SaveChanges();

			return RedirectToAction("Index");
		}
	}
}
