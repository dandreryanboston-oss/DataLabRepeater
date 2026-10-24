# DataLab — ASP.NET Web Forms Repeater

Aplicación académica para el segundo corte de ASP.NET (octubre de 2026). Incluye un catálogo de tarjetas renderizado por `asp:Repeater`, datos de ejemplo en C#, filtros del lado del servidor, comparación de controles y una lista de verificación.

## Requisitos

- Windows con Visual Studio 2019 o 2022.
- Carga de trabajo **ASP.NET and web development**.
- .NET Framework 4.7.2 Developer Pack/Targeting Pack.
- IIS Express (normalmente se instala con Visual Studio).

No requiere SQL Server: el catálogo usa una colección de objetos de muestra en memoria.

## Archivos

- `Default.aspx`: interfaz y plantillas del Repeater.
- `Default.aspx.cs`: clase de producto, colección de muestra, filtros, `DataSource`, `DataBind()` y eventos.
- `Content/site.css`: diseño adaptable.
- `Scripts/site.js`: progreso de la lista de verificación.
- `Web.config`: configuración básica de ASP.NET Web Forms.

## Ejecutar en Visual Studio

1. Descomprime `DataLabRepeater.zip` en una carpeta.
2. Abre Visual Studio.
3. Selecciona **Create a new project** → **ASP.NET Web Application (.NET Framework)**.
4. Usa el nombre `DataLabRepeater` y selecciona .NET Framework 4.7.2.
5. En la plantilla, selecciona **Empty** y marca **Web Forms** si aparece esa opción.
6. En el Explorador de soluciones, agrega o reemplaza los archivos por los de esta carpeta. Crea las carpetas `Content` y `Scripts`.
7. Confirma que `Default.aspx` tenga `CodeFile="Default.aspx.cs"` e `Inherits="DataLabRepeater.DataLabRepeater_Default"` y que el namespace/clase del code-behind coincidan. Si el proyecto usa un proyecto Web Application compilado, cambia `CodeFile` por `CodeBehind` y asegúrate de incluir el archivo en el proyecto.
8. Haz clic derecho en `Default.aspx` y selecciona **Set As Start Page**.
9. Ejecuta con **IIS Express** (F5 o Ctrl+F5).

### Alternativa rápida

Si creas un sitio web ASP.NET Web Forms del tipo **Web Site**, `CodeFile` es adecuado. Si creas un proyecto **Web Application**, normalmente se usa `CodeBehind` y la clase debe estar compilada en el ensamblado del proyecto. Sigue la opción que corresponda al tipo de proyecto que creaste.

## Qué demuestra el ejercicio

- `HeaderTemplate`: abre el contenedor de tarjetas.
- `ItemTemplate`: dibuja los elementos en posiciones normales.
- `AlternatingItemTemplate`: dibuja los elementos alternos.
- `SeparatorTemplate`: agrega un separador semántico entre registros.
- `FooterTemplate`: cierra el contenedor.
- `DataSource` y `DataBind()`: enlazan la lista de productos.
- `!IsPostBack`: la carga inicial evita volver a enlazar antes de procesar eventos.
- `Eval("Nombre")`, `Eval("Categoria")`, etc.: enlazan propiedades del objeto.
- Eventos `Click` y `Command`: permiten buscar, filtrar, limpiar y mostrar detalles.
- Comparación académica de Repeater, GridView y ListView.

## Notas

- El catálogo es de demostración y sus datos son estáticos en memoria. Para usar una base de datos, reemplaza `ObtenerProductos()` por una consulta real.
- La lista de verificación funciona en el navegador; sus marcas no se guardan en una base de datos.
- Antes de entregar, prueba cada filtro, la búsqueda, Limpiar y Ver detalle. Después sube el proyecto a GitHub y agrega el enlace a tu video de sustentación.


## Correcciones incluidas para Visual Studio

- La página `Default.aspx` usa `CodeBehind`, apropiado para un proyecto Web Application.
- `Default.aspx.designer.cs` declara los controles de servidor con la clase parcial `DataLabRepeater_Default`.
- Se eliminó una directiva ASP.NET que estaba incorrectamente al principio de `Global.asax.cs`; esa directiva pertenece en `Global.asax`.
- Se ajustó `Application_Start` como método `protected`.

Después de abrir el `.slnx` o `.csproj`, restaura los paquetes NuGet y usa **Build > Rebuild Solution**. Si Visual Studio conserva errores antiguos, cierra Visual Studio y elimina las carpetas locales `bin` y `obj` antes de volver a compilar. No elimines el código fuente.
