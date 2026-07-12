# How to Publish the Book

## One-Time Setup

1. Install Quarto from https://quarto.org/docs/get-started/
2. Go to https://github.com/vkoul/applied_econometrics_exercises/settings/pages
3. Under "Source", select **"GitHub Actions"**

## Every Time You Update the Book

1. Open a terminal in `G:\My Drive\003Claude\ecotrix`
2. Render the book:
   ```
   quarto render
   ```
3. Commit and push:
   ```
   git add -A
   git commit -m "Update book"
   git push
   ```
4. Wait 1-2 minutes — the book will be live at:
   https://vkoul.github.io/applied_econometrics_exercises/

## Adding a New Chapter

1. Create a new file, e.g. `ch3-topic-name.qmd`
2. Add it to `_quarto.yml` under `chapters:`
   ```yaml
   chapters:
     - index.qmd
     - ch2-multiple-regression.qmd
     - ch3-topic-name.qmd
   ```
3. Render and push (steps 2-4 above)
