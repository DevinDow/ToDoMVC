using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using ToDoMVC.ViewModels;

namespace ToDoMVC.Controllers
{
	public class AccountController : Controller
	{
		// GET: /Account/Login
		public ActionResult Login(string returnUrl)
		{
			ViewBag.ReturnUrl = returnUrl;
			return View();
		}

		// POST: /Account/Login
		[HttpPost]
		public ActionResult Login(AccountLoginVM model, string returnUrl)
		{
			if (ModelState.IsValid)
			{
				switch (model.User)
				{
					case "Devin":
						break;
					case "Andrea":
						break;
					default:
						ModelState.AddModelError("", "The user provided is incorrect.");
						return View(model);
				}

				if (model.Password == "riley")
				{
					FormsAuthentication.SetAuthCookie(model.User, true);

					if (Url.IsLocalUrl(returnUrl))
						return Redirect(returnUrl);

					return RedirectToAction("Index", "Home");
				}

				ModelState.AddModelError("", "The password provided is incorrect.");

				/*if (Membership.ValidateUser(model.UserName, model.Password))
				{
					FormsAuthentication.SetAuthCookie(model.UserName, model.RememberMe);

					if (Url.IsLocalUrl(returnUrl))
						return Redirect(returnUrl);

					return RedirectToAction("LoggedIn");
				}
				else
				{
					MembershipUser user = Membership.GetUser(model.UserName);
					if (user == null)
						ModelState.AddModelError("", "The user name provided does not exist.");
					else if (!user.IsApproved)
						ModelState.AddModelError("", "This account has not yet been approved.");
					else if (user.IsLockedOut)
						ModelState.AddModelError("", "This account has been locked out.");
					else
						ModelState.AddModelError("", "The password provided is incorrect.");
				}*/
			} 

			// If we got this far, something failed, redisplay form
			return View(model);
		}


		// GET: /Account/LogOff
		public ActionResult LogOff()
		{
			FormsAuthentication.SignOut();

			return RedirectToAction("Index", "Home");
		}
	}
}
