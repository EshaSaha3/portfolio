using System;
using System.Collections.Generic;

namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<Lab> allLabs = new List<Lab>
                {
                    // Semester 1
                    new Lab { Title = "Structured Language Lab", Tool = "C", Description = "Learned basics of C programming: loops, functions, arrays." },

                    // Semester 2
                    new Lab { Title = "OOP Lab", Tool = "C++", Description = "Object-Oriented Programming concepts: classes, objects, inheritance." },

                    // Semester 3
                    new Lab { Title = "Microprocessor & Microcontroller Lab", Tool = "Assembly", Description = "Worked with 8085 microprocessor and assembly language programming." },
                    new Lab { Title = "Data Structure Lab", Tool = "C++", Description = "Implemented stacks, queues, linked lists, trees." },
                    new Lab { Title = "Computer Architecture Lab", Tool = "Simulation Tools", Description = "Simulated basic CPU operations and memory management." },

                    // Semester 4
                    new Lab { Title = "Algorithm Design Lab", Tool = "C++", Description = "Implemented sorting, searching, and graph algorithms." },
                    new Lab { Title = "Android Studio Lab", Tool = "Java & Android Studio", Description = "Developed a Coffee Shop App with Firebase backend." },
                    new Lab { Title = "Desktop Applications Lab", Tool = "C#", Description = "Created Windows Forms applications with GUI." },
                    new Lab { Title = "Numerical Methods Lab", Tool = "MATLAB / C++", Description = "Implemented numerical solutions for mathematical problems." }
                };

                LabsRepeater.DataSource = allLabs;
                LabsRepeater.DataBind();
            }
        }
    }

    // Lab Class
    public class Lab
    {
        public string Title { get; set; }
        public string Tool { get; set; }
        public string Description { get; set; }
    }
}
