<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE xml>
<!--
  ~ Copyright (C) 2001-2016 Food and Agriculture Organization of the
  ~ United Nations (FAO-UN), United Nations World Food Programme (WFP)
  ~ and United Nations Environment Programme (UNEP)
  ~
  ~ This program is free software; you can redistribute it and/or modify
  ~ it under the terms of the GNU General Public License as published by
  ~ the Free Software Foundation; either version 2 of the License, or (at
  ~ your option) any later version.
  ~
  ~ This program is distributed in the hope that it will be useful, but
  ~ WITHOUT ANY WARRANTY; without even the implied warranty of
  ~ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
  ~ General Public License for more details.
  ~
  ~ You should have received a copy of the GNU General Public License
  ~ along with this program; if not, write to the Free Software
  ~ Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA
  ~
  ~ Contact: Jeroen Ticheler - FAO - Viale delle Terme di Caracalla 2,
  ~ Rome - Italy. email: geonetwork@osgeo.org
  -->

<xsl:stylesheet xmlns:gmd="http://www.isotc211.org/2005/gmd"
                xmlns:gco="http://www.isotc211.org/2005/gco"
                xmlns:gml="http://www.opengis.net/gml"
                xmlns:srv="http://www.isotc211.org/2005/srv"
                xmlns:geonet="http://www.fao.org/geonetwork"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:gmx="http://www.isotc211.org/2005/gmx"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:util="java:org.fao.geonet.util.XslUtil"
                xmlns:skos="http://www.w3.org/2004/02/skos/core#"
                xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
                version="2.0"
                exclude-result-prefixes="#all">

  
  
  

  <!-- This file defines what parts of the metadata are indexed by Lucene
       Searches can be conducted on indexes defined here.
       The Field@name attribute defines the name of the search variable.
       If a variable has to be maintained in the user session, it needs to be
       added to the GeoNetwork constants in the Java source code.
       Please keep indexes consistent among metadata standards if they should
       work across different metadata resources -->
  <!-- ========================================================================================= -->

  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="no"/>




  <!-- ========================================================================================= -->
  <xsl:template match="/">
  
		<xsl:variable name="langCode" select="'eng'"/>
		<Document locale="{$langCode}">
	
	<Field name="type" string="indicator" store="true" index="true"/>
				<Field name="_locale" string="{$langCode}" store="true" index="true"/>
			<Field name="_docLocale" string="{$langCode}" store="true" index="true"/>
			
     <Field name="_defaultTitle"
				string="{/Indicators/IndicatorAssessment/IndicatorTitle}"
				store="true" index="true"/>
				
				<Field name="IndicatorTitle"
				string="{/Indicators/IndicatorAssessment/IndicatorTitle}"
				store="true" index="true"/>
				
				<Field name="IndicatorCode"
				string="{/Indicators/IndicatorAssessment/IndicatorCode}"
				store="true" index="true"/>
				
				
				<Field name="IndicatorSource"
				string="{/Indicators/IndicatorAssessment/IndicatorSource}"
				store="true" index="true"/>
				
				<Field name="UniqueReference"
				string="{/Indicators/IndicatorAssessment/UniqueReference}"
				store="true" index="true"/>
				
				<Field name="ContactMail"
				string="{/Indicators/@ContactMail}"
				store="true" index="true"/>

				<Field name="ContactName"
				string="{/Indicators/@ContactName}"
				store="true" index="true"/>
				
				<Field name="ContactOrganisation"
				string="{/Indicators/@ContactOrganisation}"
				store="true" index="true"/>
				
				<Field name="ReportingDate"
				string="{/Indicators/@ContactOrganisation}"
				store="true" index="true"/>
				
				<!-- 
   <Field name="URL"
				string="{/Indicators/IndicatorAssessment/Datasets/URL}"
				store="true" index="true"/>
				-->
				<!-- 
							<xsl:apply-templates
				select="/Indicators/IndicatorAssessment/Datasets/URL">
				<xsl:with-param name="name" select="'URL'"/>
				<xsl:with-param name="store" select="'true'"/>
			</xsl:apply-templates>
				
				
				
				-->
				<Field name="CountryCode"
				string="{/Indicators/CountryCode}"
				store="true" index="true"/>
				
				
				
				
				
				<Field name="any" store="false" index="true">
				<xsl:attribute name="string">
					<xsl:value-of
						select="normalize-space(string(/Indicators))"/>
					<xsl:text> </xsl:text>
					<xsl:for-each select="//@codeListValue">
						<xsl:value-of select="concat(., ' ')"/>
					</xsl:for-each>
				</xsl:attribute>
			</Field>
			
			
			<!--
			
			
						<xsl:for-each 
				select="/Indicators/IndicatorAssessment/Datasets">
				<Field name="URL1" string="{string(.)}" store="true" index="true"/>
				
			</xsl:for-each> 
			-->
				<!--
			<xsl:variable name="DatasetList">{
			<xsl:for-each select="Indicators/IndicatorAssessment/Datasets">
			'dataset': [
				<xsl:for-each select="URL">
				<xsl:value-of select="concat('''', replace(., '''', '\\'''), '''')"/>
			  
			  </xsl:for-each>
			  <xsl:for-each select="MD_URL">
				<xsl:value-of select="concat('''', replace(., '''', '\\'''), '''')"/>
			  
			  </xsl:for-each>
          <xsl:if test="position() != last()">,</xsl:if>
			
			
			
			  
		  </xsl:for-each>
		  ]}
		  </xsl:variable>
		  
			<Field name="DatasetList"
             string="{normalize-space($DatasetList)}"
             store="true"
             index="true"/>
			-->
			<xsl:variable name="urls">[
			<xsl:for-each select="Indicators/IndicatorAssessment/Datasets">
			{
			'url': 
				<xsl:for-each select="URL">
				<xsl:value-of select="concat('''', replace(., '''', '\\'''), '''')"/>
			  
			  </xsl:for-each>
			  ,'md_url':
			  <xsl:for-each select="MD_URL">
				<xsl:value-of select="concat('''', replace(., '''', '\\'''), '''')"/>
			  
			  </xsl:for-each>
			  }
			  <xsl:if test="position() != last()">,</xsl:if>
          			 
		  </xsl:for-each>
		  ]
		  </xsl:variable> 
		  <Field name="datasets"
             string="{normalize-space($urls)}"
             store="true"
             index="true"/>
		  
			
          <xsl:for-each select="Indicators/IndicatorAssessment/Datasets">
			  <xsl:for-each select="URL">
				<Field name="URL" string="{string(.)}" store="true" index="true"/>
			  
			  </xsl:for-each>
			  <xsl:for-each select="MD_URL">
				<Field name="MD_URL" string="{string(.)}" store="true" index="true"/>
			  
			  </xsl:for-each>
		  </xsl:for-each>
		  
		  
		  
		  <xsl:variable name="f">[
			<xsl:for-each select="Indicators/IndicatorAssessment/Feature">
			{
			'GEScomponent': 
				<xsl:for-each select="GEScomponent">
				<xsl:value-of select="concat('''', replace(., '''', '\\'''), '''')"/>
			  
			  </xsl:for-each>
			  ,'Feature':
			  <xsl:for-each select="Feature">
				<xsl:value-of select="concat('''', replace(., '''', '\\'''), '''')"/>
			  
			  </xsl:for-each>
			  }
			  <xsl:if test="position() != last()">,</xsl:if>
          			 
		  </xsl:for-each>
		  ]
		  </xsl:variable> 
		  <Field name="features"
             string="{normalize-space($f)}"
             store="true"
             index="true"/>
		  
		  
		  
		  <xsl:for-each select="Indicators/IndicatorAssessment/Feature">
			  <xsl:for-each select="GEScomponent">
				<Field name="GEScomponent" string="{string(.)}" store="true" index="true"/>
			  </xsl:for-each>
			  <xsl:for-each select="Feature">
				<Field name="Feature" string="{string(.)}" store="true" index="true"/>
			  </xsl:for-each>
		  </xsl:for-each>
          
		  
		  
		  
		  
		  
		  <xsl:variable name="m">[
			<xsl:for-each select="Indicators/IndicatorAssessment/MarineUnit">
			{
			'MarineReportingUnit': 
				<xsl:for-each select="MarineReportingUnit">
				<xsl:value-of select="concat('''', replace(., '''', '\\'''), '''')"/>
			  
			  </xsl:for-each>
			  }
			  <xsl:if test="position() != last()">,</xsl:if>
          			 
		  </xsl:for-each>
		  ]
		  </xsl:variable> 
		  <Field name="MarineReportingUnit"
             string="{normalize-space($m)}"
             store="true"
             index="true"/>
			 
			 
		  
			  
          <!-- not tokenized title for sorting -->
		  
	    
		
	</Document>
	
	
	
	
	
	
  </xsl:template>

	<xsl:template match="*">
		<xsl:param name="name" select="name(.)"/>
		<xsl:param name="store" select="'false'"/>
		<xsl:param name="index" select="'true'"/>

		<Field name="{$name}" string="{string(.)}" store="{$store}" index="{$index}"/>
	</xsl:template>

  <!-- Add index mode template in order to easily add new field in the index (eg. in profiles).

  For example, index some keywords from a specific thesaurus in a new field:
  <xsl:template mode="index"
      match="gmd:MD_Keywords[gmd:thesaurusName/gmd:CI_Citation/
                  gmd:title/gco:CharacterString='My thesaurus']/
                  gmd:keyword[normalize-space(gco:CharacterString) != '']">
      <Field name="myThesaurusKeyword" string="{string(.)}" store="true" index="true"/>
  </xsl:template>

  Note: if more than one template match the same element in a mode, only one will be
  used (usually the last one).

  If matching a upper level element, apply mode to its child to further index deeper level if required:
      <xsl:template mode="index" match="gmd:EX_Extent">
          ... do something
          ... and continue indexing
          <xsl:apply-templates mode="index" select="*"/>
      </xsl:template>
  -->
 


  <!-- ========================================================================================= -->

  <!-- ========================================================================================= -->

</xsl:stylesheet>
