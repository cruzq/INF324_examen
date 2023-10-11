using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace AccesoInformacion
{
    public class InicioController : Controller
    {
        public IActionResult Index()
        {
            // Header
            ViewData["Titulo"] = "Inicio";

            // Navigation
            ViewData["Navegacion"] = new List<string>
            {
                "Carrera",
                "Kardex",
                "Instituto de Investigación",
                "Login"
            };

            // Carrera
            var carrera = new Carrera
            {
                Nombre = "Ingeniería de Sistemas e Informática",
                Fundacion = 1973,
                Objetivos = "Formación profesional con excelencia",
                PlanCurricular = "Ciencias de la Computación, Informática, Matemáticas, Sistemas y Gestión",
                AprendizajePractico = "Laboratorio Superior de Informática- LASIN"
            };
            ViewData["Carrera"] = carrera;

            // Kardex
            var kardex = new Kardex
            {
                Ubicacion = "2do patio del Monoblock, edif. de Informática, Piso 2"
            };
            ViewData["Kardex"] = kardex;

            // Instituto de Investigación
            var instituto = new InstitutoDeInvestigacion
            {
                ActividadesInvestigacion = "Enmarcadas en las líneas de investigación, las exigencias de la sociedad, la evolución de la ciencia y tecnología informática",
                InteraccionSocial = "Difusíón y capacitación de la informática en la sociedad"
            };
            ViewData["Instituto"] = instituto;

            return View();
        }

        public class Carrera
        {
            public string Nombre { get; set; }
            public int Fundacion { get; set; }
            public string Objetivos { get; set; }
            public string PlanCurricular { get; set; }
            public string AprendizajePractico { get; set; }
        }

        public class Kardex
        {
            public string Ubicacion { get; set; }
        }

        public class InstitutoDeInvestigacion
        {
            public string ActividadesInvestigacion { get; set; }
            public string InteraccionSocial { get; set; }
        }
    }
}