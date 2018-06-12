# Bootstrap3 for OJS 3+

A community-built theme for OJS 3+ that implements Bootstrap 3 components.

## Installation

1. Download the [latest release](https://github.com/NateWr/bootstrap3/releases).
2. Unpack the .zip file and move the `bootstrap3` directory to your OJS installation at `/plugins/themes/bootstrap3`.
3. Login to the admin area of your OJS website. Browse to the Settings > Website > Plugins page and enable the Bootstrap 3 theme.
4. Browse to the Settings > Website > Appearance page and select Bootstrap 3 from the theme option and save your change.

You can now see the Bootstrap 3 theme on your website. Go back to the Settings > Website > Appearance page (or refresh the page if it is still open) to view options to switch to any of the bundled Bootstrap 3 themes.

## Version Compatibility

Some versions of the Bootstrap3 theme are only compatible with certain releases of OJS. This release list indicates which versions are compatible.

* **Bootstrap3 v1.1.4** is compatible with OJS 3.1.1-1, 3.1.1-2.
* **Bootstrap3 v1.1.3** is compatible with OJS 3.1.1-1.
* **Bootstrap3 v1.1.2** is compatible with OJS 3.1.1.
* **Bootstrap3 v1.1.1** is compatible with OJS 3.1.1.
* **Bootstrap3 v1.1** is compatible with OJS 3.1.
* **Bootstrap3 v1.0.2** is compatible with OJS 3.0.2.
* **Bootstrap3 v1.0.1** is compatible with OJS 3.0.1.
* **Bootstrap3 v1.0.0** is compatible with OJS 3.0.0.

## Project Aims

This project was born at the [2016 PKP Sprint](https://pkp.sfu.ca/2016/04/29/sprinting-in-montreal/) in Montreal. It aims to provide a common starting point for anyone who wants to build a custom theme for OJS 3.0.

The goal was to stay true to Bootstrap 3's core components, so that developers familiar with the HTML, CSS and JavaScript framework can more easily read and customize the code base. By sticking close to Bootstrap 3's supported components, the theme is able to more easily leverage the many existing Bootstrap 3 resources out there.

## Contribution

This theme is a work-in-progress. It may not support all features of OJS 3.0 and some of the bundled themes could use some polish. It's intended to act as a base for custom development, but many journals may use it out-of-the-box.

If you see something that could be improved, please issue a Pull Request.

Thanks to everyone who has contributed to this theme:

- Nate Wright, @NateWr ([PKP](https://pkp.sfu.ca))
- Roger Gillis, @rcgillis ([PKP](https://pkp.sfu.ca)/[Dalhousie](http://www.dal.ca/))
- Sophy Ouch, @sophyo ([Érudit](http://www.erudit.org/en/))
- Michael Felczak, @mfelczak ([PKP](https://pkp.sfu.ca))
- Marc Behiels ([WebKitchen](http://webkitchen.ca/))
- Ted Roeder ([Cold Spring Harbor Laboratory](http://www.cshl.edu/))
- William Alejandro Ortiz Porras, @wortizBiteca ([Biteca Ltda, Columbia](http://www.biteca.com/))
- Ramón Martins Sodoma da Fonseca (IBCIT, Brazil)
- Alexander Kiselev, @Avernial
- Nikos Kasioumis, @kasioumis
- Karam Qubsi, @karamqubsi
- Simon Mitternacht, @mittinatten
- Marco Tullney, @mtub
- Dennis Müller, @dennmuel ([UB Mannheim](https://www.bib.uni-mannheim.de/))

## Changelog

**1.1.4** (2018-06-12)
* Fix: Escape user input in search template

**1.1.3** (2018-06-04)
* Fix: Missing privacy consent statements in registration form

**1.1.2** (2018-04-23)
* Fix: Fatal error on Editorial Team page

**1.1.1** (2018-04-10)
* Fix #68: Visual separation of multiple authors without affiliation/orcid
* Fix #72: HTML article galley display
* Fix: Use correct home URL in multi-journal installations
* Add: Pagination template in Bootstrap style #30
* Add: Article subtitles appear in issue table of contents
* Add: Indicate required registration form fields
* Update: Remote galleys displayed as primary galleys
* Update: Translations for da_DK, id_ID

**1.1** (2017-10-24)
* Fix: Don't try to load additional stylesheet for base theme
* Add: Custom navigation menu support
* Add: Subscription support
* Add: Author biographies on article details page
* Add: German and Serbian translations
* Add: RTL support (h/t Karam Qubsi)
* Update: New OJS/PKP logo in footer
* Update: Support new how-to-cite format
* Update: Split display of primary and supplementary galleys
* Update: Use SVG ORCID icon

**1.0.2** (2017-02-07)
* Fix: PDF view header styles
* Fix: Issue cover and description switch to column layout
* Update: Use new localised cover images methods for issue and article cover images
* Add: Show references on article details page
* Add: Add support for recaptcha on registration

**1.0.1** (2016-11-29)
* Fix: add missing Contact link to primary nav menu (h/t @Avernial)
* Fix: style the PDF view header and view pane
* Fix: forgotten password form (h/t @Avernial)
* Fix: remove deprecated privacy statement from submissions page
* Update: use localised cover images introduced in OJS 3.0.1
* Update: use new sidebar key introduced in OJS 3.0.1

**1.0.0** (2016-09-01)
* Initial release
