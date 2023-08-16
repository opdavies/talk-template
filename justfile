presentation_name := "talk-template"

_default:
  @just --list

clean:
  find . -type f -name *.pdf -or -name *.rst.build_temp -delete

generate:
  rst2pdf slides.rst \
    --break-level 1 \
    -e preprocess \
    --fit-background-mode scale \
    --font-path ./fonts \
    --output {{ presentation_name }}.pdf \
    --stylesheets style-light,tango,vs \
  && rst2pdf slides.rst \
    --break-level 1 \
    -e preprocess \
    --fit-background-mode scale \
    --font-path ./fonts \
    --output {{ presentation_name }}-dark.pdf \
    --stylesheets style-dark,tango,monokai

thumbnail slideNumber:
  pdftoppm {{ presentation_name }}.pdf -png -f {{ slideNumber }} -l {{ slideNumber }} > {{ presentation_name }}-{{ slideNumber }}.png
