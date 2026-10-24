<%@ Page Language="C#" Culture="es-CO" UICulture="es" ResponseEncoding="utf-8" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DataLabRepeater.DataLabRepeater_Default" %>
<!DOCTYPE html>
<html lang="es">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>DataLab | ASP.NET Repeater</title>
    <link rel="stylesheet" href="Content/site.css" />
</head>
<body>
<form id="form1" runat="server">
    <header class="topbar">
        <nav class="nav" aria-label="Navegación principal">
            <a class="brand" href="#inicio"><span class="brand-mark">D</span><span>DataLab <b>ASP.NET</b></span></a>
            <div class="nav-links">
                <a href="#concepto">Concepto</a><a href="#catalogo">Catálogo</a>
                <a href="#comparativa">Comparativa</a><a href="#proceso">DataBind</a><a href="#entrega">Entrega</a>
            </div>
        </nav>
    </header>

    <section class="hero" id="inicio">
        <div class="hero-inner">
            <div>
                <span class="eyebrow">● Segundo corte · Octubre 2026</span>
                <h1>Diseña mejor.<br />Repite con <em>Repeater.</em></h1>
                <p>Un laboratorio visual de ASP.NET Web Forms para mostrar colecciones de datos con HTML personalizado, construir cards y comparar Repeater, GridView y ListView.</p>
                <div class="hero-actions">
                    <a class="btn btn-light" href="#catalogo">Explorar las cards ↗</a>
                    <a class="btn btn-outline" href="#comparativa">Ver comparativa</a>
                </div>
            </div>
            <div class="code-window">
                <div class="window-bar"><i></i><i></i><i></i><span>Default.aspx</span></div>
                <pre><code>&lt;asp:Repeater ID="rptProductos"
    runat="server"&gt;
  &lt;ItemTemplate&gt;
    &lt;article class="product-card"&gt;
      &lt;h3&gt;&lt;%# Eval("Nombre") %&gt;&lt;/h3&gt;
    &lt;/article&gt;
  &lt;/ItemTemplate&gt;
&lt;/asp:Repeater&gt;</code></pre>
            </div>
        </div>
    </section>

    <main>
        <section class="stats">
            <article class="stat"><strong>100%</strong><span>Control del HTML con Repeater</span></article>
            <article class="stat"><strong>3 controles</strong><span>Comparados en un mismo lugar</span></article>
            <article class="stat"><strong>DataBind()</strong><span>Paso esencial para enlazar datos</span></article>
        </section>

        <section class="section" id="concepto">
            <div class="section-heading">
                <div><span class="kicker">01 · Fundamentos</span><h2>¿Qué es Repeater?</h2>
                    <p class="sub">Es un control de enlace a datos de ASP.NET Web Forms que repite una plantilla por cada registro, sin imponer un diseño visual propio.</p>
                </div>
            </div>
            <div class="grid-3">
                <article class="feature"><div class="icon">✦</div><h3>HTML a tu medida</h3><p>Defines la estructura visual que se repite: tarjetas, listados, catálogos o tablas con marcado propio.</p></article>
                <article class="feature"><div class="icon">⚡</div><h3>Ligero y flexible</h3><p>No genera una interfaz completa automáticamente. Tú decides el marcado y los estilos.</p></article>
                <article class="feature"><div class="icon">⌘</div><h3>Datos enlazados</h3><p>Puede mostrar registros provenientes de listas, bases de datos, DataTables u otros orígenes compatibles.</p></article>
            </div>
        </section>

        <section class="section" id="catalogo">
            <div class="section-heading">
                <div><span class="kicker">02 · Aplicación demostrativa</span><h2>Catálogo de ejemplo</h2>
                    <p class="sub">Las tarjetas de esta sección sí se generan desde un control <code>asp:Repeater</code> enlazado a una colección C#.</p>
                </div>
                <span class="tag">ASP.NET + C#</span>
            </div>

            <div class="panel">
                <div class="toolbar">
                    <label class="sr-only" for="txtBuscar">Buscar productos</label>
                    <asp:TextBox ID="txtBuscar" runat="server" CssClass="search" placeholder="Buscar por nombre o categoría..." />
                    <asp:Button ID="btnBuscar" runat="server" Text="Buscar" CssClass="btn btn-primary" OnClick="btnBuscar_Click" />
                    <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" CssClass="btn btn-muted" OnClick="btnLimpiar_Click" CausesValidation="false" />
                </div>

                <div class="filters" role="group" aria-label="Filtrar por categoría">
                    <asp:LinkButton ID="lnkTodos" runat="server" CssClass="filter" CommandArgument="Todos" OnCommand="Filtro_Command">Todos</asp:LinkButton>
                    <asp:LinkButton ID="lnkTecnologia" runat="server" CssClass="filter" CommandArgument="Tecnología" OnCommand="Filtro_Command">Tecnología</asp:LinkButton>
                    <asp:LinkButton ID="lnkDiseno" runat="server" CssClass="filter" CommandArgument="Diseño" OnCommand="Filtro_Command">Diseño</asp:LinkButton>
                    <asp:LinkButton ID="lnkDatos" runat="server" CssClass="filter" CommandArgument="Datos" OnCommand="Filtro_Command">Datos</asp:LinkButton>
                </div>

                <asp:Label ID="lblResultados" runat="server" CssClass="results-label" />
                <asp:Repeater ID="rptProductos" runat="server" OnItemCommand="rptProductos_ItemCommand">
                    <HeaderTemplate><div class="cards"></HeaderTemplate>
                    <ItemTemplate>
                        <article class="product-card">
                            <div class='card-cover <%# Eval("ColorClase") %>'>
                                <div><span class="tag tag-glass"><%# Eval("Categoria") %></span><h3><%# Eval("Nombre") %></h3></div>
                                <div class="avatar"><%# Eval("Inicial") %></div>
                            </div>
                            <div class="card-body">
                                <h3><%# Eval("Subtitulo") %></h3>
                                <p><%# Eval("Descripcion") %></p>
                                <div class="card-meta"><span>Ref. <%# Eval("Codigo") %></span><span class="status">● Disponible</span></div>
                                <asp:LinkButton ID="btnDetalle" runat="server" CssClass="text-link" CommandName="Detalle" CommandArgument='<%# Eval("Codigo") %>' CausesValidation="false">Ver detalle →</asp:LinkButton>
                            </div>
                        </article>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <article class="product-card alternate-card">
                            <div class='card-cover <%# Eval("ColorClase") %>'>
                                <div><span class="tag tag-glass"><%# Eval("Categoria") %></span><h3><%# Eval("Nombre") %></h3></div>
                                <div class="avatar"><%# Eval("Inicial") %></div>
                            </div>
                            <div class="card-body">
                                <h3><%# Eval("Subtitulo") %></h3>
                                <p><%# Eval("Descripcion") %></p>
                                <div class="card-meta"><span>Ref. <%# Eval("Codigo") %></span><span class="status">● Disponible</span></div>
                                <asp:LinkButton ID="btnDetalleAlterno" runat="server" CssClass="text-link" CommandName="Detalle" CommandArgument='<%# Eval("Codigo") %>' CausesValidation="false">Ver detalle →</asp:LinkButton>
                            </div>
                        </article>
                    </AlternatingItemTemplate>
                    <SeparatorTemplate><span class="sr-only">Separador entre tarjetas</span></SeparatorTemplate>
                    <FooterTemplate></div></FooterTemplate>
                </asp:Repeater>
                <asp:Panel ID="pnlVacio" runat="server" CssClass="empty" Visible="false">
                    No hay elementos que coincidan con la búsqueda. Prueba otra palabra o categoría.
                </asp:Panel>
            </div>
            <asp:Panel ID="pnlDetalle" runat="server" CssClass="detail-panel" Visible="false">
                <asp:Label ID="lblDetalle" runat="server" />
            </asp:Panel>
            <div class="note"><strong>Nota técnica:</strong> el catálogo se renderiza desde C# mediante <code>DataSource</code> y <code>DataBind()</code>. Los botones Buscar, Limpiar, los filtros y “Ver detalle” hacen postback y procesan la selección en el servidor.</div>
        </section>

        <section class="section" id="comparativa">
            <div class="section-heading"><div><span class="kicker">03 · Análisis comparativo</span><h2>Repeater vs. GridView vs. ListView</h2>
                <p class="sub">La elección depende del control visual y de las funciones automáticas que necesita la aplicación.</p></div></div>
            <div class="panel table-wrap">
                <table>
                    <thead><tr><th>Criterio</th><th>Repeater</th><th>GridView</th><th>ListView</th></tr></thead>
                    <tbody>
                        <tr><td>Generación de HTML</td><td><span class="pill pill-good">Control manual</span></td><td>HTML generado por el control</td><td>HTML basado en plantillas</td></tr>
                        <tr><td>Ligereza</td><td><span class="pill pill-good">Más ligero</span></td><td>Más pesado</td><td>Más pesado</td></tr>
                        <tr><td>Paginación automática</td><td><span class="pill pill-mid">No incluida</span></td><td>Sí, con configuración</td><td>Sí, con configuración</td></tr>
                        <tr><td>Edición / CRUD</td><td>Requiere lógica propia</td><td>Funciones integradas disponibles</td><td>Funciones integradas disponibles</td></tr>
                        <tr><td>Uso recomendado</td><td>Cards, catálogos y diseños personalizados</td><td>Tablas y CRUD rápido</td><td>Listados y CRUD con plantillas</td></tr>
                    </tbody>
                </table>
            </div>
        </section>

        <section class="section" id="proceso">
            <div class="section-heading"><div><span class="kicker">04 · Flujo de datos</span><h2>Cómo enlazar un Repeater</h2>
                <p class="sub">El control no obtiene ni enlaza los datos por sí solo: el código debe proporcionar el origen y llamar a <code>DataBind()</code>.</p></div></div>
            <div class="two-col">
                <div class="panel">
                    <ol class="steps">
                        <li><strong>Obtener los datos</strong><span>Consulta la base de datos o prepara una lista de objetos.</span></li>
                        <li><strong>Asignar el DataSource</strong><span>Establece el origen de datos del Repeater.</span></li>
                        <li><strong>Llamar a DataBind()</strong><span>Enlaza los datos y evalúa las expresiones de la plantilla.</span></li>
                        <li><strong>Definir las plantillas</strong><span>Usa ItemTemplate y las demás plantillas que requiera el diseño.</span></li>
                    </ol>
                    <div class="note">En la carga inicial, <code>!IsPostBack</code> evita volver a enlazar los datos innecesariamente durante cada postback.</div>
                </div>
                <div class="panel">
                    <h3>Ejemplo C# aplicado</h3>
                    <pre class="code-block"><code>if (!IsPostBack)
{
    CargarProductos();
}

private void CargarProductos()
{
    rptProductos.DataSource = ObtenerProductos();
    rptProductos.DataBind();
}</code></pre>
                    <p class="sub small">El proyecto incluye la implementación de <code>ObtenerProductos()</code> con datos de muestra en memoria, sin requerir una base de datos externa.</p>
                </div>
            </div>
        </section>

        <section class="section" id="plantillas">
            <div class="section-heading"><div><span class="kicker">05 · Plantillas</span><h2>Plantillas utilizadas</h2>
                <p class="sub">El Repeater permite controlar el marcado de cada registro y el contenido que rodea la colección.</p></div></div>
            <div class="grid-3">
                <article class="feature"><span class="tag">Principal</span><h3>ItemTemplate</h3><p>Define el HTML que se repite para los registros en posiciones normales.</p></article>
                <article class="feature"><span class="tag">Incluida</span><h3>HeaderTemplate</h3><p>Abre el contenedor de tarjetas antes de renderizar los elementos.</p></article>
                <article class="feature"><span class="tag">Incluida</span><h3>FooterTemplate</h3><p>Cierra el contenedor al terminar de renderizar los registros.</p></article>
                <article class="feature"><span class="tag">Incluida</span><h3>AlternatingItemTemplate</h3><p>Define la presentación de los elementos alternos.</p></article>
                <article class="feature"><span class="tag">Incluida</span><h3>SeparatorTemplate</h3><p>Inserta un separador semántico entre los elementos.</p></article>
                <article class="feature"><span class="tag">Enlace</span><h3>Eval("Campo")</h3><p>Imprime valores de los campos. El nombre debe coincidir con las propiedades del origen de datos.</p></article>
            </div>
        </section>

        <section class="section" id="entrega">
            <div class="section-heading"><div><span class="kicker">06 · Revisión de entrega</span><h2>Lista de verificación</h2>
                <p class="sub">Marca cada requisito cuando lo hayas terminado. La lista se ejecuta en el navegador.</p></div></div>
            <div class="panel">
                <div class="checklist" id="checklist">
                    <label class="checkline"><input type="checkbox" /><span><strong>Investigar Repeater</strong><small>Explicar propósito, características y casos de uso.</small></span></label>
                    <label class="checkline"><input type="checkbox" /><span><strong>Explicar las cards y cómo se acoplan con Repeater</strong><small>Mostrar una tarjeta dentro de ItemTemplate.</small></span></label>
                    <label class="checkline"><input type="checkbox" /><span><strong>Crear el aplicativo y demostrar las plantillas</strong><small>Ejecutar la aplicación en Visual Studio.</small></span></label>
                    <label class="checkline"><input type="checkbox" /><span><strong>Comparar GridView, ListView y Repeater</strong><small>Incluir HTML, ligereza, paginación y CRUD.</small></span></label>
                    <label class="checkline"><input type="checkbox" /><span><strong>Diseñar una grilla propia con Repeater</strong><small>Personalizar tarjetas y estilos CSS.</small></span></label>
                    <label class="checkline"><input type="checkbox" /><span><strong>Subir el código y agregar el enlace del video</strong><small>Comprobar que el repositorio y el video sean accesibles.</small></span></label>
                </div>
                <div class="progress"><div class="progress-bar" id="progressBar"></div></div>
                <div class="progress-label"><span id="progressText">0 de 6 requisitos completados</span><span id="progressPercent">0%</span></div>
            </div>
        </section>
    </main>
    <footer><div class="footer-inner"><strong>DataLab · ASP.NET Web Forms</strong><span>Segundo corte · Octubre de 2026</span><span>Recurso académico demostrativo</span></div></footer>
    <script src="Scripts/site.js"></script>
</form>
</body>
</html>
