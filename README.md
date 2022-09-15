# Verkehrswende_railway
This repo is part of an academic working paper on ecological transitions in the transport sector, focusing on the railway infrastructure.

You can find the main code and plots attached.
## Code
The files are used for the twitter and document analysis. Most files are shipped as Jupyter notebooks. However, the streamgraph was created through R.

## Queries
The queries used for Twitter and the document analysis are key. So here are the major selectors in a nutshell:

### Twitter
- Verkehrswende: ´'Verkehrswende OR Mobilitätswende -is:retweet'´,
- 9-Euro-Ticket: ´´´'9euroticket OR 9EuroTicket OR 9-Euro-Ticket OR 9-Euroticket OR Neun-Euro-Ticket OR Neuneuroticket OR 9€-Ticket'´´´

Regex functions to select mobility forms:
- Railway: ´´´'(?i)\sbahn|Bahn|DB\s|Güterverkehr|Güterverkehr|Schiene|schiene|Schienengüterverkehr|Fernverkehr|Nahverkehr|Cargo|Züge|Zug\s'´´´
- E-Mobility: ´´´'(?i)Elektromobilität|Elektroautos|Elektroauto|Elektroantrieb|EAuto|E-Auto|Emobilität|E-Mobilität|Elektromobil|Elektrofahrzeug'´´´
- Cycling: ´´´'(?i)Radverkehr|Fahrradverkehr|Fahrradfahren|Fahrrad|Radfahren|radeln|\srad\s'´´´
- Regional transport: ´´´'(?i)öpnv|oepnv|öffentlicher Personennahverkehr|oeffentlicher Personennahverkehr|Nahverkehr'´´´

Party-selection for the 9EuroTicket analysis:
- ´´´'((?i)grüne\s|grüne-|die_gruene|die_grünen|gruenen|bündnis\s90|die\sgrünen|die_gruenen'´´´,
- ´´´'(?i)^((?!nofdp|noafdp).)$|fdp\s|fdp-|fdpbt|freie\sdemokraten|freien\sdemokraten'´´´ # This catches a few christian organisations,
- ´´´'(?i)^((?!nocdu|Skandale).)$|(\scdu\s|cdu-|union-|\sunion\s|christlich\s|christliche\s|CDUCSUBT|csu)'´´´,
- ´´´'(?i)spd\s|spd-|sozialdemokrat-|sozialdemokrat\s|sozialdemokratie\s|sozialdemokraten|\ssozi\s|\ssoze\s'´´´

### Report word groups
The accounting/report documents by Deutsche Bahn searched for work groups. These are the words searched for via regex:
- Verkehrswende = ´´´r'(?i)verkehrsw|mobilitätsw|verkehrsverl'´´´
- Digital = ´´´r'(?i)digi'´´´
- Nachhaltigkeit = ´´´r'(?i)nachha|sustaina'´´´
- Ökologie = ´´´r'(?i)(?=(öko|umwelt|natur))(?!(ökonomi|naturgemäß|natürlich))'´´´
- Verspätung = ´´´r'(?i)verpät|pünktl'´´´
- Energie = ´´´r'(?i)energie|strom|solar|sonnenen|winde|strom|kohle|gas|erneuerbare|astroms'´´´
- Klima = ´´´r'(?i)klima|co2|kohlenstoffdioxid|climate|carbon|treibhausg'´´´
- Reform = ´´´r'(?i)reform|restruktur'´´´
- Obsoleszenz = ´´´r'(?i)obsoleszenz|repar|schaden|instandh|störung|instandse|stillstand|baustell|sani|renovi|mainten|wiederaufb|ausbess|veraltet'´´´
- Wettbewerb = ´´´r'(?i)wettbe|konkurr|marktfü'´´´

## Plots
All plots created by the software code is included here. As a bonus graph, the comparison of Verkehrswende and Verkehrssicherheit is attached.
