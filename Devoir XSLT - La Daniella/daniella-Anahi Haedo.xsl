<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs tei"
    version="2.0">
    
<!-- Attention une sortie HTML - exclusion du préfixe tei des résultats -->
    
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
   
<!-- pour éviter les espaces non voulus -->
    
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="/">
        
<!-- On stocke le nom le chemin du fichier courant -->
       
        <xsl:variable name="witfile">
            <xsl:value-of select="replace(base-uri(.), '.xml', '')"/>
            
 <!-- récupération du nom du fichier courant -->
        </xsl:variable>
        
        <xsl:variable name="path_homepage">
            <xsl:value-of select="concat($witfile, 'html/homepage', '.html')"/>
        </xsl:variable>
        
        <xsl:variable name="path_pers_index">
            <xsl:value-of select="concat($witfile, 'html/pers_index', '.html')"/>
        </xsl:variable>
        
        <xsl:variable name="path_lieux_index">
            <xsl:value-of select="concat($witfile, 'html/place_index', '.html')"/>
        </xsl:variable>
        
        <xsl:variable name="path_about">
            <xsl:value-of select="concat($witfile, 'html/about', '.html')"/>
        </xsl:variable>
        
        <xsl:variable name="path_transcription">
            <xsl:value-of select="concat($witfile, 'html/transcription', '.html')"/>
        </xsl:variable>
        
        <xsl:variable name="path_original_edition">
            <xsl:value-of select="concat($witfile, 'html/original_edition', '.html')"/>
        </xsl:variable>
        
    <!-- On crée un footer pour la mise en page -->
        
        <xsl:variable name="footer">
            <footer class="text-center text-white" style="background-color: #f1f1f1;">
                <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
                    <p>Anahi Haedo - 2022</p>
                </div>
            </footer>
        </xsl:variable>    
        
 <!-- On crée le head HTML -->
        
        <xsl:variable name="head">
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <meta name="description"
                    content="Encodage du Feuilleton de la presse - La Daniella, de George Sand (1857)"/>
                <meta name="keywords" content="edition, tei, xslt, roman-feuilleton"/>
                <meta name="author" content="Anahi Haedo"/>
                <title>
                    
<!-- On récupère le titre de l'oeuvre littéraire encodée directement dans le XML source -->
                    <xsl:value-of
                        select="concat(//titleStmt/title, ', ', //titleStmt//forename, ' ', //titleStmt//surname)"/>
                </title>
                <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"/>
                <link
                    href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
                    rel="stylesheet"
                    integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
                    crossorigin="anonymous"/>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"/>
                
                
<!-- On utilise la fonction concat() pour concaténer plusieurs chaînes de caractères afin de mettre en page les informations -->
            </head>
        </xsl:variable> 
        
<!-- On crée une barre de navigation -->
        
        <xsl:variable name="nav_bar">
            <nav class="navbar navbar-expand-md navbar-dark bg-dark justify-content-between">
                <a class="navbar-brand" style="padding-left: 5px" href="{$path_homepage}">
               </a>
                
<!-- Pour chaque output HTML, on crée un lien de navigation dans la barre de navigation -->
                
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        
 <!-- On récupère une variable entre {}. Les variables suivantes étant les chemins de fichier des différents outputs. -->
                        
                        <a class="nav-link" href="{$path_original_edition}">Edition d'origine</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{$path_transcription}">Transcription</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{$path_pers_index}">Index des personnages</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{$path_lieux_index}">Index des noms de lieux</a>
                    </li>  
                    <li class="nav-item">
                        <a class="nav-link" href="{$path_about}">A propos</a>
                    </li>
                </ul>
            </nav>
        </xsl:variable>
        
<!-- SORTIES HTML -->
        
        <xsl:result-document href="{$path_homepage}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$nav_bar"/>
                    <div style="padding: 20px;">
    
                    </div>
                    <div class="container">
                        <div style="text-align: center; padding-top: 20px;">
                            <p>Bienvenue dans ce projet d'encodage du Feuilleton de la presse - La Daniella, de George Sand (1857)</p>
                            <p>Cette édition propose d'enrichir la lecture de l'oeuvre originale.</p>
                        </div>
                    </div>
                </body> 
            </html>
        </xsl:result-document>
        
<!-- On crée l'index des personnages -->
        
        <xsl:result-document href="{$path_pers_index}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$nav_bar"/>
                    <div class="container">
                        <h1>Index des noms de personnages</h1>
                        <ul>
                            
<!-- On appelle une xsl:template créée plus bas grâce à l'attribut @name. -->
                            
                            <xsl:call-template name="pers_index"/>
                        </ul>
                    </div>
                </body>
            </html>
        </xsl:result-document>
        
<!-- On crée l'index des noms de lieux -->
        
        <xsl:result-document href="{$path_lieux_index}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$nav_bar"/>
                    <div class="container">
                        <h1>Index des noms de lieux</h1>
                        <ul>
                            <xsl:call-template name="place_index"/>
                        </ul>
                    </div>
                </body>
            </html>
        </xsl:result-document>
        
<!-- On crée la sortie HTML pour afficher les informations de l'édition originale -->
        
        <xsl:result-document href="{$path_original_edition}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$nav_bar"/>
                    <div class="container">
                        <h1>Informations bibligraphiques de l'édition d'origine</h1>
                        <ul>
                            <li>Titre : <xsl:value-of select="//biblStruct/analytic/title"/></li>
                            <li>Auteur : <xsl:value-of
                                select="concat(//biblStruct/analytic//forename, ' ', //biblStruct/analytic//surname)"
                            /></li>
                            <li>Edition : <xsl:value-of
                                select="//publicationStmt/publisher"
                            /></li>
                            <li>Date d'édition : <xsl:value-of select="//publicationStmt//date"/></li>
                            <li>Mise à disposition par : <a href="{//publicationStmt//distributor/@facs}"
                                ><xsl:value-of select="//publicationStmt//distributor"/></a></li>
                        </ul>
                    </div>
                </body>
                <xsl:copy-of select="$footer"/>
            </html>
        </xsl:result-document>
        
<!-- On crée la sortie HTML de la transcription -->
        
        <xsl:result-document href="{$path_transcription}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$nav_bar"/>
                    <div class="container">
                        <xsl:element name="div">
                            <xsl:apply-templates select="//body"/>
                        </xsl:element>
                    </div>
                </body>
                <xsl:copy-of select="$footer"/>
            </html>
        </xsl:result-document>
        
<!-- On crée la sortie HTML pour la page à propos -->
        
        <xsl:result-document href="{$path_about}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$nav_bar"/>
                    <div class="container">
                        <h1 style="text-align: center; padding: 20px;">Projet d'édition numérique -
                            La Daniella, George Sand (1857).</h1>
                        <h2 style="text-align: center; padding: 10px;">Encodage XML-TEI</h2>
                        <p>Ce projet d'édition numérique résulte de l'encodage en XML-TEI d'un
                            passage du feuilleton de la Presse La Daniella, écrit par George Sand, à
                            l'aide d'une ODD et d'une RNG personnalisée. L'encodage a été réalisé à
                            partir de l'édition numérisée, disponible sur <a
                                href="https://gallica.bnf.fr/ark:/12148/bpt6k477548c">Gallica</a>.
                            Ces règles spécifiques ont été appliquées dans le but de :</p>
                        <ul>
                            <li>Identifier les personnages et les lieux.</li>
                            <li>Mettre en relief la structure littéraire de l'oeuvre textuelle
                                encodée. Se faisant, cet encodage est propice à la création d'un
                                outil de recherche scientifique, facilitant la navigation dans
                                l'oeuvre.</li>
                        </ul>
                        <h2 style="text-align: center; padding: 10px;">Transformations XSL</h2>
                        <p>Les transformations XSL ont pour but de réaliser une sortie HTML depuis
                            l'encodage en XML. L'édition numérique se présente ainsi sous la forme
                            de plusieurs pages HTML :</p>
                        <ul>
                            <li>Une page d'accueil</li>
                            <li>Les informations bibliographiques de l'édition d'origine</li>
                            <li>La transcription du passage encodé</li>
                            <li>L'index des personnages</li>
                            <li>L'index des noms de lieux</li>
                            <li>Une page à propos donnant des informations sur le projet</li>
                        </ul>
                        <h2 style="text-align: center; padding: 10px;">Evaluation</h2>
                        <p>Ce projet a été réalisé par <a href="https://github.com/anahihaedo">Anahi
                            Haedo</a> dans le cadre de l'évaluation du module d'XML-TEI et
                            d'XSLT du Master 2 "Technologies appliquées à l'histoire" de l'Ecole
                            nationale des chartes. La feuille de transformation XSL doit répondre
                            aux critères suivants :</p>
                        <ul>
                            <li>Mettre en place une structure d'accueil HTML</li>
                            <li>Rédiger des règles simples avec un Xpath valide pour insérer des
                                informations du document source dans le document de sortie</li>
                            <li>Créer une ou des règles avec des conditions</li>
                            <li>Utiliser une ou des règles for-each uniquement si cela est
                                nécessaire</li>
                            <li>Proposer un code facile à lire et commenté</li>
                            <li>Simplifier le plus possible ses règles XSL</li>
                        </ul>
                    </div>
                </body>
                <xsl:copy-of select="$footer"/>
            </html>
        </xsl:result-document>
    </xsl:template>
    <xsl:template name="lieux_index"/>
   
    <!-- Templates -->
    
    <!-- Template d'affichage de l'index des personnages -->
    
    <xsl:template name="pers_index" match="//listPerson">
        <!-- On écrit une boucle for-each pour pouvoir trier par ordre alphabétique les personnages avec xsl:sort -->
        <!-- La boucle nous permettra également d'afficher les occurences des personnages dans le roman -->
        <xsl:for-each select="//person">
            <xsl:sort select="persName" order="ascending"/>
            <li> 
                
        <!-- On affiche le nom du personnage -->
                <xsl:value-of select="persName"/>
            </li>
        </xsl:for-each>
    </xsl:template>
    
<!-- Template d'affichage de l'index des noms de lieux -->
    
        <xsl:template name="place_index">
            
<!-- On utilise une boucle for-each pour pouvoir créer une mise en page en fonction des informations disponibles pour chaque lieu. -->
            <xsl:for-each select="//listPlace/place">
                <xsl:sort select=".//name"/>
                <li>
                    <xsl:value-of select="placeName//name"/>
                    
                    <xsl:value-of select="concat(' (', @type, ')')"/>
                </li>
            </xsl:for-each>
        </xsl:template>
    
<!-- Règles pour afficher la transcription -->
        
        <!-- Afin d'afficher une transcription avec seulement le texte, on utilise le mode #all -->
        <!-- On traite les <head> des <div> de premier niveau -->
        <xsl:template match="//body/div/head" mode="#all">
            <xsl:element name="h1">
                <xsl:attribute name="class">text-center</xsl:attribute>
                <xsl:value-of select="."/>
            </xsl:element>
        </xsl:template>
        
<!-- On traite les <head> des <div> de deuxième niveau -->
    
        <xsl:template match="//body/div/div/head" mode="#all">
            <xsl:element name="h2">
                <xsl:attribute name="class">text-center</xsl:attribute>
                <xsl:value-of select="."/>
            </xsl:element>
        </xsl:template>
        
<!-- On traite les <head> des <div> de troisième niveau -->
    
        <xsl:template match="//body/div/div/div/head" mode="#all">
            <xsl:element name="h3">
                <xsl:attribute name="class">text-center</xsl:attribute>
                <xsl:value-of select="."/>
            </xsl:element>
        </xsl:template>
        
<!-- On traite les <p> -->
    
        <xsl:template match="//body//p" mode="#all">
            <xsl:element name="p">
                <xsl:apply-templates mode="#current"/>
            </xsl:element>
        </xsl:template>
        
<!-- On traite les <hi> dans les <p> pour que l'affichage soit également en italique dans la sortie HTML -->
        <xsl:template match="hi[@rend = 'italic']">
            <xsl:element name="i">
                <xsl:apply-templates/>
            </xsl:element>
        </xsl:template>
    
 
</xsl:stylesheet>