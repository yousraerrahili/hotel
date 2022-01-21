<%@page import="services.ChambreServices"%>
<%@page import="entities.Chambre"%>
<% 
    
    if(session.getAttribute("idUser")==null){
        
        
                
               response.sendRedirect("login.jsp");
        
    }

%>
<body >
<%@ include file="Components/Navbar.jsp"%>
<%@ include file="Components/side.html"%>

        <div  class="bg-dark text-white content-wrapper">

            <h3 class="card-title mb-5 col-lg-9"  style="display: inline">Gestion Chambres</h3>
            
            <div style="
    display: inline-block;
    width: 230px;"
    class="col-lg-6"
>
                <a href="AddChambre.jsp"  style="float: right;    text-decoration: none;
    border: solid #fff 2px;
    padding: 8px; " > Ajouter Chambre </a>
            </div>
            <br>
            <br>
            <br>
       <div class="row">
           <%   ChambreServices us = new ChambreServices();
                                for(Chambre u : us.findAll() )
                                {
                          %>
            <div class="col-lg-4 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                                      <h4 class="card-title text-center m-2" >Chambre <%= u.getNumero()%></h4>

                                      <img src="images/<%= u.getPhoto()%>" style="width: 100%; height: 297px" class="my-3" alt="image1"/>
                    <h4>Type : <%= u.getType()%></h4>
                    <h4>tarif : <%= u.getTarif()%> Dh</h4>
                    <form class="d-inline-block " action="ChambreServlet">
                        <input type="text" value="<%= u.getIdChambre()%>" hidden  name="id">
                        <input type="text" value="sup" hidden=""  name="op">

                        <button type="submit" class="btn btn-outline-danger me-2">Supprimer</button>
                    </form>
                        <a class="btn btn-outline-primary me-2" href="ModChambre.jsp?id=<%= u.getIdChambre()%>"  > Modifier</a>
                    

                </div>
              </div>
            </div>
                 <%
                              
                              }
                                   
                          %>

       </div>
            
        </div>
	<%@ include file="Components/Footer.html"%>
        </div>
</div>
    </div>