using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DataLabRepeater
{
    public partial class DataLabRepeater_Default : Page
    {
        private const string Todos = "Todos";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["CategoriaSeleccionada"] = Todos;
                CargarProductos();
            }
        }

        private List<Producto> ObtenerProductos()
        {
            // Datos de muestra en memoria. No se necesita una base de datos externa.
            return new List<Producto>
            {
                new Producto { Codigo = "WEB-01", Nombre = "ASP.NET Web Forms", Subtitulo = "Desarrollo web", Categoria = "Tecnología", Inicial = "A", ColorClase = "cover-purple", Descripcion = "Construye interfaces dinámicas con controles de servidor y plantillas HTML." },
                new Producto { Codigo = "UI-02", Nombre = "Cards UI", Subtitulo = "Tarjetas reutilizables", Categoria = "Diseño", Inicial = "C", ColorClase = "cover-green", Descripcion = "Presenta cada registro como un bloque visual independiente y fácil de recorrer." },
                new Producto { Codigo = "DAT-03", Nombre = "Data binding", Subtitulo = "Origen de datos", Categoria = "Datos", Inicial = "D", ColorClase = "cover-orange", Descripcion = "Conecta una colección al control y enlaza los valores mediante expresiones Eval()." },
                new Producto { Codigo = "ASP-04", Nombre = "Repeater", Subtitulo = "Plantillas flexibles", Categoria = "Tecnología", Inicial = "R", ColorClase = "cover-purple", Descripcion = "Repite la estructura definida para cada elemento de la colección enlazada." },
                new Producto { Codigo = "CSS-05", Nombre = "HTML + CSS", Subtitulo = "Diseño adaptable", Categoria = "Diseño", Inicial = "H", ColorClase = "cover-green", Descripcion = "Controla espaciado, colores, tipografía y distribución en diferentes pantallas." },
                new Producto { Codigo = "DAT-06", Nombre = "Eval(\"Campo\")", Subtitulo = "Mostrar propiedades", Categoria = "Datos", Inicial = "E", ColorClase = "cover-orange", Descripcion = "Inserta valores de los campos del origen de datos dentro de la plantilla." }
            };
        }

        private void CargarProductos()
        {
            string categoria = Convert.ToString(ViewState["CategoriaSeleccionada"] ?? Todos);
            string termino = (txtBuscar.Text ?? String.Empty).Trim();

            IEnumerable<Producto> consulta = ObtenerProductos();

            if (!String.Equals(categoria, Todos, StringComparison.OrdinalIgnoreCase))
                consulta = consulta.Where(p => p.Categoria.Equals(categoria, StringComparison.OrdinalIgnoreCase));

            if (!String.IsNullOrWhiteSpace(termino))
            {
                consulta = consulta.Where(p =>
                    p.Nombre.IndexOf(termino, StringComparison.OrdinalIgnoreCase) >= 0 ||
                    p.Categoria.IndexOf(termino, StringComparison.OrdinalIgnoreCase) >= 0 ||
                    p.Subtitulo.IndexOf(termino, StringComparison.OrdinalIgnoreCase) >= 0 ||
                    p.Descripcion.IndexOf(termino, StringComparison.OrdinalIgnoreCase) >= 0);
            }

            List<Producto> resultado = consulta.ToList();
            rptProductos.DataSource = resultado;
            rptProductos.DataBind();

            pnlVacio.Visible = resultado.Count == 0;
            lblResultados.Text = resultado.Count + (resultado.Count == 1 ? " resultado" : " resultados");
            ActualizarFiltros(categoria);
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            pnlDetalle.Visible = false;
            CargarProductos();
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            txtBuscar.Text = String.Empty;
            ViewState["CategoriaSeleccionada"] = Todos;
            pnlDetalle.Visible = false;
            CargarProductos();
        }

        protected void Filtro_Command(object sender, CommandEventArgs e)
        {
            ViewState["CategoriaSeleccionada"] = Convert.ToString(e.CommandArgument);
            pnlDetalle.Visible = false;
            CargarProductos();
        }

        protected void rptProductos_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Detalle")
            {
                string codigo = Convert.ToString(e.CommandArgument);
                Producto producto = ObtenerProductos().FirstOrDefault(p => p.Codigo == codigo);

                if (producto != null)
                {
                    lblDetalle.Text = "<strong>" + Server.HtmlEncode(producto.Nombre) + "</strong> — " +
                                      Server.HtmlEncode(producto.Descripcion) +
                                      " <span class='detail-code'>Código: " + Server.HtmlEncode(producto.Codigo) + "</span>";
                    pnlDetalle.Visible = true;
                }
            }
        }

        private void ActualizarFiltros(string categoria)
        {
            EstablecerClase(lnkTodos, categoria == Todos);
            EstablecerClase(lnkTecnologia, categoria == "Tecnología");
            EstablecerClase(lnkDiseno, categoria == "Diseño");
            EstablecerClase(lnkDatos, categoria == "Datos");
        }

        private static void EstablecerClase(LinkButton boton, bool activo)
        {
            boton.CssClass = activo ? "filter active" : "filter";
            boton.Attributes["aria-pressed"] = activo ? "true" : "false";
        }

        public class Producto
        {
            public string Codigo { get; set; }
            public string Nombre { get; set; }
            public string Subtitulo { get; set; }
            public string Categoria { get; set; }
            public string Inicial { get; set; }
            public string ColorClase { get; set; }
            public string Descripcion { get; set; }
        }
    }
}
