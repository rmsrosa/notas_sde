@def title = "Style Sheet and Fonts"

# {{ get_title }}

A good portion, and the inspiration, for the style sheet used here is that of the CSS in [Rik Huijzer](https://github.com/rikhuijzer)'s [Books.jl](https://github.com/JuliaBooks/Books.jl) package.

Some small changes have been made, such as adding a link to the Github repo and the name of the author in the menu bar; slighly casting an overall beige hue to the site; adding an optional background image; adjusting the font sizes; adding an optional top navigation bar; etc.

Those can also be tweaked as you like it, in [`_css/basic.css`](/css/basic.css).

Important elements to notice are the colors, font sizes and background image set in `:root` and `html`, and the fontface for code blocks, set in `pre code kbd samp`.

One should also pay attention to the `_assets/images/favicon.png`. It is currently set to a red question mark, as in Franklin.jl, to draw attention to it. Just replace the file with your favorite icon meaningful to your book or remove the line that loads the icon in `_layout/head.html`.
