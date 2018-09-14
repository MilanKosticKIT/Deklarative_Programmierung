<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="text"/>
	<xsl:template match="/">
		<xsl:apply-templates select="rechnungssammlung/rechnung[1000 > kosten/entgeld/betrag]"/>
	</xsl:template>
	<xsl:template match="rechnungssammlung/rechnung">
		<xsl:text><xsl:value-of select="leistungsempfaenger/anrede"/></xsl:text>
		<xsl:text> </xsl:text>
		<xsl:text><xsl:value-of select="leistungsempfaenger/name"/></xsl:text>
		<xsl:text>
Danke für die Zahlung von </xsl:text>
		<xsl:value-of select="kosten/entgeld/betrag"/>
		<xsl:text> für die Rechnung vom </xsl:text>
		<xsl:value-of select="number(substring(rechnungsdatum,9,2))"/><xsl:text>.</xsl:text>
		<xsl:value-of select="number(substring(rechnungsdatum,6,2))"/><xsl:text>.</xsl:text>
		<xsl:value-of select="number(substring(rechnungsdatum,1,4))"/><xsl:text>.
Ich hoffe die </xsl:text>
		<xsl:value-of select="count(dienstleistungen/dienstleistung)"/>
		<xsl:text> Einzelposten zu ihrer Zufriedenheit worden.

</xsl:text>
	</xsl:template>
</xsl:stylesheet>