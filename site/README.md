# Casa blog

## Basic site setup

Check [Hugo quickstart](https://gohugo.io/getting-started/quick-start/).

```bash
hugo new site mysite --force
```

## Theme

Install
[PaperMod](https://github.com/adityatelange/hugo-PaperMod/wiki/Installation)
theme (Method 2: submodule):

```bash
# this generate a .gitmodules file
git submodule add --depth=1 https://github.com/adityatelange/hugo-PaperMod.git themes/PaperMod
# once you have a valid .gitmodules file, just run
git submodule update --init --recursive
```

Load submodules after cloning the repo:

```bash
git submodule update --init
```

Update the theme:

```bash
git submodule update --remote --merge
```

## Add content

```bash
hugo new posts/my-first-post.md
```

Everything is a _draft_ by default, keep in mind when serving the site.
You can change this behaviour editing `./archetypes/default.md`.

## Add image

Images go to the `./static` folder.

You can reference them from your markdown (no need of "/static/" prefix):

```markdown
![Image Label](/image-name.jpg)
```

## Check content

```bash
hugo server
```

Include drafts with

```bash
hugo server --buildDrafts
```

The command hugo-lunr knows where to check for content (`./content`) and where
to create the index (`./public/lunr.json`)

## Add tags and categories

This [example](https://discourse.gohugo.io/t/how-to-add-tag-and-category/3202)
is clearer (and shorter) than the official documentation

## Add search functionality

Instructions in <https://pankajpipada.com/posts/2024-05-27-hugo-search/>

```bash
npm -g install hugo-lunr
```
