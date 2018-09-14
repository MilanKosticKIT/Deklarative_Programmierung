<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:template match="/">
		<rechnungssammlung>
			<xsl:for-each select="rechnungssammlung/rechnung">
				<xsl:if test="substring-before(rechnungsdatum, '-') > 2010">
					<rechnung>
						<leistungsempfaenger>
							<xsl:copy-of select="leistungsempfaenger/anrede"/>
							<xsl:copy-of select="leistungsempfaenger/name"/>
							<xsl:if test="starts-with(leistungsempfaenger/anrede, 'Herr') or starts-with(leistungsempfaenger/anrede,'Frau')">
								<xsl:copy-of select="leistungsempfaenger/adresse"/>
							</xsl:if>
						</leistungsempfaenger>
						<xsl:copy-of select="rechnungsdatum"/>
						<xsl:copy-of select="rechnungsnummer"/>
						<dienstleistungen>
							<xsl:for-each select="dienstleistungen/dienstleistung">
								<dienstleistung>
									<position>
										<xsl:value-of select="position()"/>
									</position>
									<xsl:copy-of select="art-der-dienstleistung"/>
									<xsl:copy-of select="einzelpreis/betrag"/>
								</dienstleistung>
							</xsl:for-each>
						</dienstleistungen>
						<kosten>
							<entgeld>
								<xsl:copy-of select="kosten/entgeld/betrag"/>
							</entgeld>
						</kosten>
					</rechnung>
				</xsl:if>
			</xsl:for-each>
		</rechnungssammlung>
	</xsl:template>
</xsl:stylesheet>