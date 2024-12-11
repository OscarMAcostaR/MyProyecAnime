<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">

	<!-- Parámetro de tipo de menú -->
	<xsl:param name="TipoMenu" select="TipoMenu"></xsl:param>

	<!-- Salida en formato HTML -->
	<xsl:output method="html" indent="yes"/>

	<!-- Plantilla raíz -->
	<xsl:template match="Animes">
		<!-- Inicia la estructura HTML -->
		<html>
			<head id="cabeza">
				<meta charset="UTF-8"/>
				<title>Anime ALLSTAR</title>
				<link href="css/style.css" rel="stylesheet"/>
				<script type="text/javascript" src="js\miDragandDrop.js"></script>
				
				
			</head>
			
			<body>
					
				<!--inicio-->
					<!-- ======= Header ======= -->
					<header id="header" class="fixed-top d-flex align-items-cente">
						<div class="container-fluid container-xl d-flex align-items-center justify-content-lg-between">

					
							<!-- Uncomment below if you prefer to use an image logo -->
							<!-- <a href="index.html" class="logo me-auto me-lg-0"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
							
							<nav id="navbar" class="navbar order-last order-lg-0">
								<ul>
									<xsl:for-each select="Opciones/Opcion">

										<li>
											<xsl:choose>
												<xsl:when test="$TipoMenu = @Id">
													<a class="nav-link scrollto active" href="{@Url}">
														<xsl:value-of select="@Texto"/>
													</a>

												</xsl:when>
												<xsl:otherwise>
													<a class="nav-link scrollto" href="{@Url}">
														<xsl:value-of select="@Texto"/>
													</a>
												</xsl:otherwise>
											</xsl:choose>
										</li>
									</xsl:for-each>

								</ul>
								<i class="bi bi-list mobile-nav-toggle"></i>
							</nav>
							<!-- .navbar -->

						</div>
					</header>
				
			
					<!--Choose section-->



					<xsl:choose>
						<xsl:when test="$TipoMenu=0">
							<xsl:call-template name="Principal"></xsl:call-template>
						</xsl:when>
						<xsl:when test="$TipoMenu=1">
							<xsl:call-template name="Informacion"></xsl:call-template>
						</xsl:when>
						<xsl:when test="$TipoMenu=2">
							<xsl:call-template name="PlayRoom"></xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="Principal">
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>

			</body>
		</html>
		<br></br>
	</xsl:template>



	
	
    <!--template principal -->

	<xsl:template name="Principal" match="Acción | Aventura | Romántico">


		<div class="container">
			<br></br>
			<br></br>
			<h1>Lista de Animes</h1>

			<!-- Sección de Acción -->
			<xsl:apply-templates select="Animes/Acción"/>
			<!-- Sección de Aventura -->
			<xsl:apply-templates select="Animes/Aventura"/>
			<!-- Sección Romántico -->
			<xsl:apply-templates select="Animes/Romántico"/>
		</div>
		<div class="category" id="{name()}">
			
			<div class="anime-grid">
				<!-- Contenedor de la rejilla de animes -->
				<xsl:for-each select="Tipo/Anime">
					<div class="anime">
						<img>
							<xsl:attribute name="src">
								<xsl:value-of select="Imagen"/>
							</xsl:attribute>
							<xsl:attribute name="alt">
								<xsl:value-of select="Titulo"/>
							</xsl:attribute>
						</img>
						<div class="anime-details">
							<h3>
								<xsl:value-of select="Titulo"/>
							</h3>
							<p>
								Año: <xsl:value-of select="Año"/>
							</p>
						</div>
					</div>
				</xsl:for-each>
			</div>
		</div>
	</xsl:template>
	
	<!--Fin del principal-->
	
	
	<!--Inicio del segundo -->

	

	<xsl:template name="Informacion">

		<script>
			// Definir la función initMap globalmente
			function initMap() {
			// Asegúrate de que aquí inicializas el mapa correctamente
			const mapOptions = {
			center: { lat: -34.397, lng: 150.644 },  // Cambia estas coordenadas por las deseadas
			zoom: 8
			};
			const map = new google.maps.Map(document.getElementById('map'), mapOptions);
			}
		</script>

		<script>
			<![CDATA[
			(g=>{var h,a,k,p="The Google Maps JavaScript API",c="google",l="importLibrary",q="__ib__",m=document,b=window;b=b[c]||(b[c]={});var d=b.maps||(b.maps={}),r=new Set,e=new URLSearchParams,u=()=>h||(h=new Promise(async(f,n)=>{await (a=m.createElement("script"));e.set("libraries",[...r]+"");for(k in g)e.set(k.replace(/[A-Z]/g,t=>"_"+t[0].toLowerCase()),g[k]);e.set("callback",c+".maps."+q);a.src=`https://maps.${c}apis.com/maps/api/js?`+e;d[q]=f;a.onerror=()=>h=n(Error(p+" could not load."));a.nonce=m.querySelector("script[nonce]")?.nonce||"";m.head.append(a)}));d[l]?console.warn(p+" only loads once. Ignoring:",g):d[l]=(f,...n)=>r.add(f)&&u().then(()=>d[l](f,...n))})({
			key: "AIzaSyCWeeateTaYGqsHhNcmoDfT7Us-vLDZVPs",
			// Add other bootstrap parameters as needed, using camel case.
			// Use the 'v' parameter to indicate the version to load (alpha, beta, weekly, etc.)
			});]]>
		</script>
		
		<!--Referencia a mi archivo JS-->
		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCWeeateTaYGqsHhNcmoDfT7Us-vLDZVPs&amp;callback=initMap" async="" defer=""></script>



		<!--<script src="assets/js/MiScript.js" type="text/javascript"></script>-->
		<script src="js\google.js" type="module"></script>

		<br></br>
			<!--Mapa-->
			<div data-aos="fade-up">
				<style>
					#map {
					border:0;
					width: 100%;
					height: 350px;
					}
				</style>
				<div id="google-map">
					<div id="map"></div>
				</div>
				<text id="direccion">  </text>
				<div class="col-lg-12 margin-bottom-30" id="street" style="height: 400px; width: 100%;"></div>
			</div>

		<!--Datos del Formulario-->

		<div class="info row mt-5">
			<h3>
				<xsl:value-of select="/Animes/Datos/NombreRestaurant" />
			</h3>
			<p>
				<strong>Descripción:</strong>
				<xsl:value-of select="/Animes/Datos/Descripcion" />
			</p>
			<p>
				<strong>Dirección:</strong>
				<xsl:value-of select="/Animes/Datos/Direccion" />
			</p>
			<p>
				<strong>Teléfono:</strong>
				<xsl:value-of select="/Animes/Datos/Telefono" />
			</p>
			<p>
				<strong>Correo:</strong>
				<xsl:value-of select="/Animes/Datos/correo" />
			</p>
			<p>
				<strong>Imagen:</strong>
				<br />
				<xsl:value-of select='/Animes/Datos/Imagen' />" alt="Imagen" />
			</p>
			
		</div>
		
		

		<!-- Sección del formulario -->
		<br></br>
		<div class="formulario">
			<h4>Formulario </h4>
			<br></br>
			<form action="#" method="post">
				<label for="nombre">Nombre Completo:</label>
				<input type="text" id="nombre" name="nombre" required=""/>

				<label for="correo">Correo Electrónico:</label>
				<input type="email" id="correo" name="correo" required=""/>

				<label for="fecha">Fecha:</label>
				<input type="date" id="fecha" name="fecha" required=""/>

				<label for="comentario">Comentario sobre tu anime favorito:</label>
				<textarea id="comentario" name="comentario" rows="4" required=""></textarea>

				<button type="submit">Enviar</button>
			</form>
		</div>
		
		
	</xsl:template>
	
	<!--Inicio del segundo -->



	<!--Inicio del tercero -->

	<xsl:template name="PlayRoom">

		<link href="css\draganddrop.css" rel="stylesheet"></link>
		<script src="js/draganDrop.js" type="text/javascript"></script>
		
		

		<section class="tm-section-row p-5">
			<br></br>
			<br></br>
			<h2>Audio</h2>
			<div id="Audio" style="width:100%">
				<img src="img\img1.jpg" width="100%"></img>
				<audio controls="true" style="width:100%" autoplay="autoplay">
					<source src="Audio\Loud.mp3"></source>
				</audio>
			</div>
			<br></br>
		</section>

		<!--video-->
		<section class="tm-section p-5">
			<br></br>
			<h2>Video</h2>
			<div id="Video" style="widthg:100%">
				<video controls="true" width="100%" poster="assets/img/gallery/gallery-2.jpg">
					<source src="videos\Entretenimiento.mp4"></source>
				</video>
			</div>
		</section>

		<!-- Sección Drag and Drop -->
		<section tm-section="" p-5="">
			<div class="container">
				<h1>Arrastra y suelta personajes de anime</h1>

				<!-- Imágenes de los personajes -->
				<div class="anime-images">
					<div class="anime-item" id="naruto" draggable="true">
						<img src="img/DragandDrop/naruto.PNG" alt="Naruto" />
						<p>Naruto Uzumaki</p>
					</div>
					<div class="anime-item" id="goku" draggable="true">
						<img src="img/DragandDrop/goku.PNG" alt="Goku" />
						<p>Goku</p>
					</div>
					<div class="anime-item" id="luffy" draggable="true">
						<img src="img/DragandDrop/luffy.PNG" alt="Luffy" />
						<p>Luffy</p>
					</div>
				</div>

				<!-- Zonas para arrastrar los personajes -->
				<div class="dropzones">
					<div class="dropzone" id="dropzone-1">
						<h3>Zona de Naruto</h3>
					</div>
					<div class="dropzone" id="dropzone-2">
						<h3>Zona de Goku</h3>
					</div>
					<div class="dropzone" id="dropzone-3">
						<h3>Zona de Luffy</h3>
					</div>
				</div>
			</div>


		</section>
	</xsl:template>

</xsl:stylesheet>
