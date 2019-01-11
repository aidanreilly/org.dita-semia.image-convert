<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

	<xsl:import href="plugin:org.dita.xhtml:xsl/dita2xhtml.xsl"/>

	<!-- change file extension from "svg" to "png" -->
	<xsl:template match="*[contains(@class, ' topic/image ')]/@href[matches(lower-case(.), '\.svg$')]">
		<xsl:attribute name="src" select="replace(., '...$', 'png')"/>
	</xsl:template>

	<!--AR: TODO: apply template match for map/href too-->

	<!-- change file extension from ".pdf" to "...1.png". pdfbox renders pdf images with the page number in the extension, hence the '1.png' suffix. -->
	<!-- http://www.xsltfunctions.com/xsl/fn_replace.html -->
	<xsl:template match="*[contains(@class, ' topic/image ')]/@href[matches(lower-case(.), '\.pdf$')]">
		<xsl:attribute name="src" select="replace(., '\.pdf$', '1.png')"/>
	</xsl:template>

	<!-- update keydef image maps -->
	<!-- change file extension from "svg" to "png" for keydefs-->
	<xsl:template match="*[contains(@class, ' map/keydef ')]/@href[matches(lower-case(.), '\.svg$')]">
		<xsl:attribute name="src" select="replace(., '...$', 'png')"/>
	</xsl:template>

	<!-- change file extension from ".pdf" to "...1.png" for keydefs. -->
	<xsl:template match="*[contains(@class, ' map/keydef ')]/@href[matches(lower-case(.), '\.pdf$')]">
		<xsl:attribute name="src" select="replace(., '\.pdf$', '1.png')"/>
	</xsl:template>

</xsl:stylesheet>
