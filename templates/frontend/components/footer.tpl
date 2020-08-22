{**
 * templates/frontend/components/footer.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Common site frontend footer.
 *
 * @uses $isFullWidth bool Should this page be displayed without sidebars? This
 *       represents a page-level override, and doesn't indicate whether or not
 *       sidebars have been configured for thesite.
 *}

	</main>

	{* Sidebars *}
	{if empty($isFullWidth)}
		{capture assign="sidebarCode"}{call_hook name="Templates::Common::Sidebar"}{/capture}
		{if $sidebarCode}
			<aside id="sidebar" class="pkp_structure_sidebar left col-xs-12 col-sm-2 col-md-4" role="complementary" aria-label="{translate|escape key="common.navigation.sidebar"}">
				{$sidebarCode}
			</aside><!-- pkp_sidebar.left -->
		{/if}
	{/if}
	</div><!-- pkp_structure_content -->

	<footer class="footer" role="contentinfo">

		<div class="container">

			<div class="row">

				<div class="col-sm-4" style="margin-left: -08px;">
					<h5>Enlaces</h5>
					<a href="https://uasd.edu.do//" target="blank"> Portal de Portales</a><br>			
          <a href="https://www.uasd.edu.do/index.php/informacion-general" target="blank">Lista de Índices </a><br>
          <a href="https://www.uasd.edu.do/index.php/ciencias" target="blank">Facultad de Ciencias </a><br>
          <a href="https://uasd.edu.do/index.php/escuelas3/informatica1/sobre-la-escuela" target="blank">Escuela de Informática</a><br>
        </div>
        
				<div class="col-sm-4" style="margin-left: -08px;">
          <h5>Biblioteca</h5>
          <a href="https://catalogo.uasd.edu.do/" target="blank">Catálogo en Línea</a><br>
          <a href="https://catalogo.uasd.edu.do/" target="blank">Repositorio Institucional</a><br>
          <a href="https://catalogo.uasd.edu.do/" target="blank">Mi Biblioteca</a><br>
          <a href="https://catalogo.uasd.edu.do/" target="blank">Libros Electrónicos</a><br>
				</div>

				<div class="col-sm-4" style="margin-left: -08px;">
          <h5>Interes</h5>
          <a href="https://pkp.sfu.ca/ojs/" target="blank">Información OJS</a><br>
          <a href="https://pkp.sfu.ca/scholarly-inquiry/" target="blank">Consultas OJS</a><br>
          <a href="http://eprints.rclis.org/25517/1/RevInfo_v1n1_art05.pdf" target="blank">Uso OJS Nivel Nacional</a><br>
          <a href="https://catalogo.uasd.edu.do/" target="blank">Libros Electrónicos</a><br>
        </div>
				
			</div> <!-- .row -->
		</div><!-- .container -->
	</footer>
</div><!-- pkp_structure_page -->

{load_script context="frontend" scripts=$scripts}

{call_hook name="Templates::Common::Footer::PageFooter"}
</body>
</html>
