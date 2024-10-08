<%-- 
    Document   : solohtml
    Created on : 7/09/2024, 9:24:55 a. m.
    Author     : jealv
--%>
<%@page import="modelo.Puesto" %>
<%@page import="modelo.Empleado" %>
<%@page import="java.util.HashMap" %>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    </head>
    <body>
        <h1>Formulario Empleados</h1>
        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modal_empleado">Nuevo</button>
               
        <div class="container">
        <div class="modal fade" id="modal_empleado" role="dialog">
        <div class="modal-dialog">

             <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Formulario Empleado</h4>
      </div>
      <div class="modal-body">
                <form action="sr_empleado" method="post" class="form-control"><!-- get = envio de parametros url, post = oculto -->
            <label for="lbl_id" ><b>ID</b></label>
            <input type="text" name="txt_id" id="txt_codigo" class="form-control" value = "0" readonly>
            <label for="lbl_codigo"class="form-label"><b>Codigo</b></label>
            <input type="text" name="txt_codigo" id="txt_codigo" class="form-control"placeholder="Ejemplo:E001" pattern="[E]{1}[0-9]{3}" required>
            <label for="lbl_apellidos"class="form-label"><b>Nombres</b></label>
            <input type="text" name="txt_nombres" id="txt_nombres"class="form-control" placeholder="Ejemplo: Nombre1 Nombre2 " required>
            <label for="lbl_apellidos"class="form-label"><b>Apellidos</b></label>
            <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control"placeholder="Ejemplo: Apellido1 Apellido2 " required>
            <label for="lbl_direccion"class="form-label"><b>Direccion</b></label>
            <input type="text" name="txt_direccion" id="txt_direccion" class="form-control"placeholder="Ejemplo: #casa, calle, avenida " required>
            <label for="lbl_telefono"class="form-label"><b>Telefono</b></label>
            <input type="number" name="txt_telefono" id="txt_telefono" class="form-control"placeholder="Ejemplo: 55555555 " required>
            <label for="lbl_fn"class="form-label"><b>Nacimiento</b></label>
            <input type="date" name="txt_fn" id="txt_fn" class="form-control"placeholder="Ejemplo: 1990-01-01 " required>
            <label for="lbl_puesto"class="form-label"><b>Puestos</b></label>
            <select name="drop_puesto" id="drop_puesto" class="form-select">
                <%
                    Puesto puesto = new Puesto();
                    HashMap<String,String> drop = puesto.drop_sangre();
                    for (String i: drop.keySet()){
                        out.println("<option value='" + i +"'>" + drop.get (i)+ "</option>");
                    }
                    %>
            </select>
            </br>
            
            <button name="btn_agregar" id="btn_agregar" class="btn btn-primary"value="agregar"><i class="bi bi-floppy-fill"></i>Agregar</button>
            <button name="btn_modificar" id="btn_modificar" class="btn btn-warning" value="modificar"><i class="bi bi-pencil"></i>Modificar</button>
            <button name="btn_eliminar" id="btn_eliminar" class="btn btn-danger btn-lg" onclick="javascripot:if(!confirm('¿Desea Eliminar?')) return false">Eliminar</button>
            
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

    <table class="table table-striped">
    <thead>
      <tr>
        <th>Codigo</th>
        <th>Nombres</th>
        <th>Apellidos</th>
        <th>Direccion</th>
        <th>Telefono</th>
        <th>Nacimiento</th>
        <th>Puesto</th>
      </tr>
    </thead>
    <tbody id="tbl_empleados">
        <%
        Empleado empleado = new Empleado();
        DefaultTableModel tabla = new DefaultTableModel();
        tabla = empleado.leer();
        for (int t=0;t<tabla.getRowCount();t++){
        out.println("<tr data-id=" + tabla.getValueAt(t, 0) + " + data-id_p=" + tabla.getValueAt(t,8) + ">");
        out.println("<tr>" + tabla.getValueAt(t, 0) + "</tr>");
        out.println("<tr>" + tabla.getValueAt(t, 1) + "</tr>");
        out.println("<tr>" + tabla.getValueAt(t, 2) + "</tr>");
        out.println("<tr>" + tabla.getValueAt(t, 3) + "</tr>");
        out.println("<tr>" + tabla.getValueAt(t, 4) + "</tr>");
        out.println("<tr>" + tabla.getValueAt(t, 5) + "</tr>");
        out.println("<tr>" + tabla.getValueAt(t, 6) + "</tr>");
        out.println("<tr>" + tabla.getValueAt(t, 7) + "</tr>");
        out.println("<tr>");
            
        }
        %>  

    </tbody>
  </table>
        </div>
        <script></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script type="text/javascript">
    $('#tbl_empleados').on('click','tr td',function(evt)){
       var  target,id,id_p,codigo,nombres,apellidos,direccion,telefono,nacimiento;
       target = $(event.target);
       id = target.parent().data('id');
       id_p = target.parent().data('id_p');
       codigo = target.parent("tr").find("td").eq(0).html();
       nombres = target.parent("tr").find("td").eq(1).html();
       apellidos = target.parent("tr").find("td").eq(2).html();
       direccion = target.parent("tr").find("td").eq(3).html();
       telefono = target.parent("tr").find("td").eq(4).html();
       nacimiento = target.parent("tr").find("td").eq(5).html();
       $("#txt_id").val(id);
       $("#txt_codigo").val(codigo);
       $("#txt_nombres").val(nombres);
       $("#txt_apellidos").val(apellidos);
       $("#txt_telefono").val(telefono);
       $("#txt_fn").val(nacimiento);
       $("#drop_puesto").val(id_p);
    }};
    
    </script>
    </body>
</html>
