using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;

namespace ToDoMVC.ViewModels
{
	public class HomeIndexVM
	{
		public IEnumerable<ToDoMVC.Models.List> Lists;
		public IEnumerable<ToDoMVC.Models.ListItem> ListItems;
		public ToDoMVC.Models.TimeFrame[] TimeFrames;
		public Color[] Colors;
	}
}