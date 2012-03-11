<!--
    Author: Sarven Capadisli <info@csarven.ca>
    Author URL: http://csarven.ca/#i
-->
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:dcterms="http://purl.org/dc/terms/"
    xmlns:wbldfn="http://worldbank.270a.info/xpath-function/">

    <xsl:output encoding="utf-8" indent="yes" method="xml" omit-xml-declaration="no"/>

    <xsl:function name="wbldfn:safe-term">
        <xsl:param name="string"/>
        <xsl:value-of select="replace(replace(replace(replace(replace(lower-case(encode-for-uri(replace(normalize-space($string), ' - ', '-'))), '%20|%2f|%27', '-'), '%28|%29|%24|%2c', ''), '_', '-'), '--', '-'), '^-|-$', '')"/>
    </xsl:function>

    <xsl:function name="wbldfn:prepend-dataset">
        <xsl:param name="string"/>

        <xsl:if test="$string = 'approval-quarter'
                    or $string = 'calendar-year'
                    or $string = 'financial-product'
                    or $string = 'line-item'
                    or $string = 'organization'
                    or $string = 'source'
                    or $string = 'status'
                    or $string = 'sub-account'
                    or $string = 'trustee-fund'
                    or $string = 'trustee-fund-name'
                    ">
            <xsl:value-of select="true()"/>
        </xsl:if>
    </xsl:function>

    <xsl:function name="wbldfn:usable-term">
        <xsl:param name="string"/>

        <xsl:if test="$string != ''
                    and $string != 'countryname'
                    and $string != 'countryname-and-mdk'
                    and $string != 'countrynameshortname-and-mdk'
                    and $string != 'countrynameshortname-and-mdk-exact'
                    and $string != 'countryshortname-and-mdk'
                    and $string != 'countryshortname-and-mdk-exact'
                    and $string != 'project-name'
                    and $string != 'project-name-and-mdk'
                    and $string != 'regionname-and-mdk'
                    and $string != 'regionname-and-mdk-exact'
                    and $string != 'uuid'
                    ">
            <xsl:value-of select="true()"/>
        </xsl:if>
    </xsl:function>

    <xsl:function name="wbldfn:canonical-term">
        <xsl:param name="string"/>

        <xsl:choose>
            <xsl:when test="$string = 'bb-mlns-of-usd'">
                <xsl:text>bb-us-millions</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'betf-mlns-of-usd'">
                <xsl:text>betf-us-millions</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'boardapprovaldate'">
                <xsl:text>board-approval-date</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'closingdate'">
                <xsl:text>closing-date</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'commitments-development-policy-lending'">
                <xsl:text>commitments-development-policy-lending-us-millions</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'commitments-total'">
                <xsl:text>commitments-total-us-millions</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'countryshortname-exact'">
                <xsl:text>country</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'credit-number'">
                <xsl:text>loan-number</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'credits-outstanding'">
                <xsl:text>credits-outstanding-us-millions</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'credit-status'">
                <xsl:text>loan-status</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'development-grant-expenses'">
                <xsl:text>development-grant-expenses-us-millions</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'disbursements-usd'">
                <xsl:text>disbursements-us-billions</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'envassesmentcategorycode'">
                <xsl:text>environmental-assessment-category-code</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'grantamt'">
                <xsl:text>grant-amount-us-millions</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'grant-fund-name'">
                <xsl:text>grant-name</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'gross-disbursements-development-policy-lending'">
                <xsl:text>gross-disbursements-development-policy-lending-us-millions</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'gross-disbursements-total'">
                <xsl:text>gross-disbursements-total-us-millions</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'ibrdcommamt'">
                <xsl:text>ibrd-commitment-amount</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'idacommamt'">
                <xsl:text>ida-commitment-amount</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'impagency'">
                <xsl:text>implementing-agency</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'indextype'">
                <xsl:text>index-type</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'lendinginstr'">
                <xsl:text>lending-instrument</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'lendinginstrtype'">
                <xsl:text>lending-instrument-type</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'lendprojectcost'">
                <xsl:text>lend-project-cost</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'listing-relative-url'">
                <xsl:text>listing-url</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'loans-outstanding'">
                <xsl:text>loans-outstanding-us-millions</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'net-disbursements'">
                <xsl:text>net-disbursements-us-millions</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'operating-income'">
                <xsl:text>operating-income-us-millions</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'principal-repayments-including-prepayments'">
                <xsl:text>principal-repayments-including-prepayments-us-millions</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'prodline'">
                <xsl:text>product-line</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'project-id'">
                <xsl:text>project</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'productlinetype'">
                <xsl:text>product-line-type</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'projectdocs'">
                <xsl:text>project-document</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'projectdoc.docdate'">
                <xsl:text>date</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'projectdoc.entityid'">
                <xsl:text>id</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'projectdoc.doctype'">
                <xsl:text>type</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'projectdoc.doctypedesc'">
                <xsl:text>description</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'projectdoc.docurl'">
                <xsl:text>url</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'projectstatusdisplay'">
                <xsl:text>project-status-display</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'reimbursable-mlns-of-usd'">
                <xsl:text>reimbursable-us-millions</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'regionname'">
                <xsl:text>region</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'subscriptions-and-contributions-commited-us-millions'">
                <xsl:text>subscriptions-and-contributions-committed-us-millions</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'supplementprojectflg'">
                <xsl:text>supplement-project-flag</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'totalamt'">
                <xsl:text>total-amounts</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'totalcommamt'">
                <xsl:text>total-commitment-amount</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'trustee-fund-number'">
                <xsl:text>trustee-fund</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'undisbursed-credits'">
                <xsl:text>undisbursed-credits-us-millions</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'undisbursed-grants'">
                <xsl:text>undisbursed-grants-us-millions</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'undisbursed-loans'">
                <xsl:text>undisbursed-loans-us-millions</xsl:text>
            </xsl:when>
            <xsl:when test="$string = 'usable-capital-and-reserves'">
                <xsl:text>usable-capital-and-reserves-us-millions</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$string"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <xsl:function name="wbldfn:money-amount">
        <xsl:param name="string"/>

        <xsl:if test="$string = 'amount-in-usd'
                    or $string = 'amounts-paid-in'
                    or $string = 'amounts-subject-to-call'
                    or $string = 'amount-us-millions'
                    or $string = 'bb-us-millions'
                    or $string = 'betf-us-millions'
                    or $string = 'borrower-s-obligation'
                    or $string = 'cancelled-amount'
                    or $string = 'cash-contributions-us-billions'
                    or $string = 'commitments-development-policy-lending-us-millions'
                    or $string = 'commitments-total-us-millions'
                    or $string = 'contributions-outstanding-usd'
                    or $string = 'contributions-paid-in-usd'
                    or $string = 'credits-held'
                    or $string = 'credits-outstanding-us-millions'
                    or $string = 'development-grant-expenses-us-millions'
                    or $string = 'disbursed-amount'
                    or $string = 'disbursements-us-billions'
                    or $string = 'due-3rd-party'
                    or $string = 'due-to-ibrd'
                    or $string = 'due-to-ida'
                    or $string = 'exchange-adjustment'
                    or $string = 'fy05-amount-us-millions'
                    or $string = 'fy06-amount-us-millions'
                    or $string = 'fy07-amount-us-millions'
                    or $string = 'fy08-amount-us-millions'
                    or $string = 'fy09-amount-us-millions'
                    or $string = 'fy09-budget-plan'
                    or $string = 'fy10-amount-us-millions'
                    or $string = 'fy10-budget-plan'
                    or $string = 'fy11-amount-us-millions'
                    or $string = 'fy11-budget-plan'
                    or $string = 'fy11-budget-remap'
                    or $string = 'fy12-budget-plan-fy11'
                    or $string = 'fy13-indicative-plan-fy12'
                    or $string = 'fy14-indicative-plan-fy12'
                    or $string = 'grant-amount-us-millions'
                    or $string = 'grant-commitments-usd'
                    or $string = 'gross-disbursements-development-policy-lending-us-millions'
                    or $string = 'gross-disbursements-total-us-millions'
                    or $string = 'ibrd-commitment-amount'
                    or $string = 'ida-commitment-amount'
                    or $string = 'lend-project-cost'
                    or $string = 'loans-held'
                    or $string = 'loans-outstanding-us-millions'
                    or $string = 'net-disbursements-us-millions'
                    or $string = 'operating-income-us-millions'
                    or $string = 'original-principal-amount'
                    or $string = 'principal-repayments-including-prepayments-us-millions'
                    or $string = 'receipt-amount'
                    or $string = 'reimbursable-us-millions'
                    or $string = 'repaid-3rd-party'
                    or $string = 'repaid-to-ibrd'
                    or $string = 'repaid-to-ida'
                    or $string = 'sold-3rd-party'
                    or $string = 'subscriptions-and-contributions-committed-us-millions'
                    or $string = 'total-amounts'
                    or $string = 'total-commitment-amount'
                    or $string = 'total-contribution-usd'
                    or $string = 'undisbursed-amount'
                    or $string = 'undisbursed-credits-us-millions'
                    or $string = 'undisbursed-grants-us-millions'
                    or $string = 'undisbursed-loans-us-millions'
                    or $string = 'usable-capital-and-reserves-us-millions'
                    ">
            <xsl:value-of select="true()"/>
        </xsl:if>
    </xsl:function>

    <xsl:function name="wbldfn:now">
        <xsl:value-of select="format-dateTime(current-dateTime(), '[Y0001]-[M01]-[D01]T[H01]:[m01]:[s01]Z')"/>
    </xsl:function>


    <xsl:function name="wbldfn:get-quarter">
        <xsl:param name="string"/>

        <xsl:choose>
            <xsl:when test="lower-case(normalize-space($string)) = 'jan-mar'">
                <xsl:text>Q1</xsl:text>
            </xsl:when>
            <xsl:when test="lower-case(normalize-space($string)) = 'apr-jun'">
                <xsl:text>Q2</xsl:text>
            </xsl:when>
            <xsl:when test="lower-case(normalize-space($string)) = 'jul-sep'">
                <xsl:text>Q3</xsl:text>
            </xsl:when>
            <xsl:when test="lower-case(normalize-space($string)) = 'oct-dec'">
                <xsl:text>Q4</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text></xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>


    <xsl:function name="wbldfn:get-date">
        <xsl:param name="date"/>

        <xsl:analyze-string select="lower-case(normalize-space($date))" regex="([0-9]{{2}})-([a-z]{{3}})-([0-9]{{4}})">
            <xsl:matching-substring>
                <xsl:variable name="monthName" select="regex-group(2)"/>

                <xsl:variable name="month">
                    <xsl:choose>
                        <xsl:when test="$monthName = 'jan'"><xsl:text>01</xsl:text></xsl:when>
                        <xsl:when test="$monthName = 'feb'"><xsl:text>02</xsl:text></xsl:when>
                        <xsl:when test="$monthName = 'mar'"><xsl:text>03</xsl:text></xsl:when>
                        <xsl:when test="$monthName = 'apr'"><xsl:text>04</xsl:text></xsl:when>
                        <xsl:when test="$monthName = 'may'"><xsl:text>05</xsl:text></xsl:when>
                        <xsl:when test="$monthName = 'jun'"><xsl:text>06</xsl:text></xsl:when>
                        <xsl:when test="$monthName = 'jul'"><xsl:text>07</xsl:text></xsl:when>
                        <xsl:when test="$monthName = 'aug'"><xsl:text>08</xsl:text></xsl:when>
                        <xsl:when test="$monthName = 'sep'"><xsl:text>09</xsl:text></xsl:when>
                        <xsl:when test="$monthName = 'oct'"><xsl:text>10</xsl:text></xsl:when>
                        <xsl:when test="$monthName = 'nov'"><xsl:text>11</xsl:text></xsl:when>
                        <xsl:when test="$monthName = 'dec'"><xsl:text>12</xsl:text></xsl:when>
                        <xsl:otherwise><xsl:text>00</xsl:text></xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>

                <xsl:value-of select="regex-group(3)"/><xsl:text>-</xsl:text><xsl:value-of select="$month"/><xsl:text>-</xsl:text><xsl:value-of select="regex-group(1)"/>
            </xsl:matching-substring>
            <xsl:non-matching-substring>
<!--                    <xsl:value-of select="format-date(current-dateTime(), '[Y0001]-[M01]-[D01]')"> -->
                <xsl:value-of select="$date"/>
            </xsl:non-matching-substring>
        </xsl:analyze-string>
    </xsl:function>

    <xsl:template name="resource-refperiod">
        <xsl:param name="date"/>

        <xsl:attribute name="rdf:resource">
            <xsl:analyze-string select="$date" regex="(([0-9]{{4}})|([1-9][0-9]{{3,}})+)(Q[1-4])">
                <xsl:matching-substring>
                    <xsl:text>http://reference.data.gov.uk/id/quarter/</xsl:text><xsl:value-of select="regex-group(1)"/><xsl:text>-</xsl:text><xsl:value-of select="regex-group(4)"/>
                </xsl:matching-substring>
                <xsl:non-matching-substring>
                    <xsl:analyze-string select="$date" regex="(([0-9]{{4}})|([1-9][0-9]{{3,}})+)">
                        <xsl:matching-substring>
                           <xsl:text>http://reference.data.gov.uk/id/year/</xsl:text><xsl:value-of select="regex-group(1)"/>
                        </xsl:matching-substring>
                        <xsl:non-matching-substring>
                            <xsl:analyze-string select="$date" regex="FY([0-9]{{2}})">
                                <xsl:matching-substring>
                                   <xsl:text>http://reference.data.gov.uk/id/year/20</xsl:text><xsl:value-of select="regex-group(1)"/>
                                </xsl:matching-substring>
                                <!-- XXX: May not be ideal -->
                                <xsl:non-matching-substring>
                                   <xsl:text>http://reference.data.gov.uk/id/year/{date}"</xsl:text>
                                </xsl:non-matching-substring>
                            </xsl:analyze-string>
                        </xsl:non-matching-substring>
                    </xsl:analyze-string>
                </xsl:non-matching-substring>
            </xsl:analyze-string>
        </xsl:attribute>
    </xsl:template>

    <xsl:template name="datatype-date">
        <xsl:attribute name="rdf:datatype">
            <xsl:text>http://www.w3.org/2001/XMLSchema#dateTime</xsl:text>
        </xsl:attribute>
    </xsl:template>

    <xsl:template name="datatype-dbo-usd">
        <xsl:attribute name="rdf:datatype">
            <xsl:text>http://dbpedia.org/resource/United_States_dollar</xsl:text>
        </xsl:attribute>
    </xsl:template>

    <xsl:template name="provenance">
        <xsl:param name="date"/>
        <xsl:param name="dataSource"/>
        <dcterms:issued>
            <xsl:call-template name="datatype-date"/>
            <xsl:value-of select="$date"/>
        </dcterms:issued>
        <dcterms:source rdf:resource="{$dataSource}"/>
        <dcterms:creator rdf:resource="http://csarven.ca/#i"/>
    </xsl:template>
</xsl:stylesheet>
