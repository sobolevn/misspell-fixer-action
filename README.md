# misspell-fixer-action

[![wemake.services](https://img.shields.io/badge/%20-wemake.services-green.svg?label=%20&logo=data%3Aimage%2Fpng%3Bbase64%2CiVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAABGdBTUEAALGPC%2FxhBQAAAAFzUkdCAK7OHOkAAAAbUExURQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP%2F%2F%2F5TvxDIAAAAIdFJOUwAjRA8xXANAL%2Bv0SAAAADNJREFUGNNjYCAIOJjRBdBFWMkVQeGzcHAwksJnAPPZGOGAASzPzAEHEGVsLExQwE7YswCb7AFZSF3bbAAAAABJRU5ErkJggg%3D%3D)](https://wemake.services)

📝Automatically fixes typos and mistakes in your source code and docs!

Based on awesome [misspell-fixer](https://github.com/vlajos/misspell-fixer) tool.


## Usage

We had a typo in our `entrypoint.sh` file to show how this Github Action works.
By using a pipeline of three actions we are able to receive [PRs like this one](https://github.com/sobolevn/misspell-fixer-action/pull/3).

Here's how our configuration looks like:

```yml
- uses: actions/checkout@v2
- uses: sobolevn/misspell-fixer-action@master
- uses: peter-evans/create-pull-request@v2.4.4
  with:
    token: ${{ secrets.GITHUB_TOKEN }}
```

Here's how it works:

1. The first [`actions/checkout@v2`](https://github.com/actions/checkout) action checkouts our code from the repo
2. Our own `sobolevn/misspell-fixer-action` finds misspells and fixes them
3. Then [`peter-evans/create-pull-request`](https://github.com/peter-evans/create-pull-request) creates a PR with the fixes created earlier
4. Done!

See logs of our [own Github Actions](https://github.com/sobolevn/misspell-fixer-action/runs/520513568?check_suite_focus=true) with the fixed typo.

And here's how our [workflow looks like](https://github.com/sobolevn/misspell-fixer-action/blob/master/.github/workflows/misspell.yml).


## Options and outputs

You can pass any options that are supported by `misspell-fixer` tool,
to do so you can use `options` key:

```yml
- uses: sobolevn/misspell-fixer-action@master
  with:
    options: '-rsvn src/'
```

You can also use the output produced by this action by default.
Read more about [outputs](https://help.github.com/en/actions/building-actions/metadata-syntax-for-github-actions#outputs).


## License

MIT.
