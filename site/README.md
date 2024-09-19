# Casa blog

## Basic site setup

Check [Hugo quickstart](https://gohugo.io/getting-started/quick-start/).

I already had a GitHub repo for this so ..

```bash
hugo new site mysite --force
```

## Theme

Install [PaperMod](https://github.com/adityatelange/hugo-PaperMod/wiki/Installation) theme (Method 2: submodule):

```bash
cd casa
git submodule add --depth=1 https://github.com/adityatelange/hugo-PaperMod.git themes/PaperMod
git submodule update --init --recursive # needed when you reclone your repo (submodules may not get cloned automatically)
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

Everything is a _draft_ by default

## Add image

Images go to the `./static` folder.

You can reference them from your markdown (no need of "/static/" prefix):

```
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

## Add search functionality

Let's try <https://www.npmjs.com/package/hugo-lunr>

```bash
npm -g install hugo-lunr
```

The command hugo-lunr knows where to check for content (`./content`) and where to create the index (`./public/lunr.json`)

## Add tags and categories

This [example](https://discourse.gohugo.io/t/how-to-add-tag-and-category/3202) is clearer (and shorter) than the oficial documentation

## Add basic search

<https://jimmysong.io/en/blog/hugo-instant-search-guide/>

<https://makewithhugo.com/add-search-to-a-hugo-site/>
