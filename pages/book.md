@def title = "Book Configuration"

# {{ get_title }}

Several configuration variables can be set in the [config.md](https://raw.githubusercontent.com/rmsrosa/booksjl-franklin-template/main/config.md) file. Concerning book-related variables, we have the following ones:

* `book_title::String`: title of the book;
* `book_subtitle::String`: subtitle of the book;
* `book_author::String`: name of the author or co-authors of the book;
* `show_license::Bool`: whether to display the license information at the bottom of each page or not;
* `book_license::String`: description of the license type;
* `license_link::String`: url link to the license;
* `book_licensees::String`: name of the copyright owner(s) or such.

Both `book_title` and `book_license` already link to specific urls (`index.html` and the given `license_link`, respectively). The other String variables are free to include html code to other links (e.g. as used for the author of this example/template) or just left as pure text strings.
