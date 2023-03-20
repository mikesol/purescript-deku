# purescript-deku

![deku](./deku.gif)

A PureScript web framework for apps that need to be fast.

## In anger

- [Verity Scheel's snowflow](https://snowflow.surge.sh/) is snowflake-themed work of web-art.
- [Verity Scheel's post on parsing](https://cofree.coffee/~verity/parser.html) implements a full-featured tweening engine to animate rule-based parsing steps.
- [Horizontal and Vertical Events](https://dev.to/mikesol/horizontal-and-vertical-events-1pm1) is an article that explores some concepts central to Deku with many tryable & editable examples.

## Documentation

[Here is a guide](https://purescript-deku.netlify.app/) to building apps with Deku. The guide is written in Deku and its source code can be found [here](https://github.com/mikesol/deku-documentation). **You should probably start your Deku journey with this guide.** It contains everything you need to build a Deku app, from bootstrapping a project to `Hello World` to a Discord clone!

Indexed documentation for Deku is published on [Pursuit](https://pursuit.purescript.org/packages/purescript-deku). Deku's structure is currently highly decentralized, so it can be tough to know where to look. Here's a small Deku app that acts as a legend for the Pursuit docs.

```purescript
main :: Effect Unit
main =
  -- `Deku.Toplevel` contains runInBody
  -- and other functions for hydration and SSR
  runInBody myNut
  where
  -- `Deku.Core` contains the `Nut` type, which is the type
  -- of all Deku applications.
  myNut :: Nut
  myNut = 
    -- `Deku.Do`` is the rebindable do context that allows you
    -- to use hooks in Deku
    Deku.do
      -- `Deku.Hooks` contains hooks like `useState`,
      -- `useDyn`, and `useMemoized`
      setCounter /\ counter <- useState 0
      -- `Deku.DOM`, often imported as `D`, contains all DOM elements,
      -- attributes, and event handlers
      D.div
        ( oneOf
            [
              -- `Deku.Listeners` contains helper functions for various common
              -- listeners like `click` and `keyUp`
              click $ counter <#> add 1 >>> setCounter
            -- `Deku.Attributes` contains helper functions for various common
            -- attributes like `style` and `klass` (an alias for `class`)
            , klass_ "color: crimson;"
            -- `Deku.CSS` contains `render`, which allows you to take `CSS` from
            -- `purescript-css` and use it in a Deku application
            , style_ $ render do
               color (rgb 42 142 242)
               fontWeight bold
            -- `Deku.Attribute` contains constructors for
            -- uncommon and ad hoc `x-` attributes
            , pure (xdata "my-attr" "my-val")
            ]
        )
        [
          -- `Deku.Control` contains all non-element buiding blocks
          -- for applications, including `text` and `<#~>`, which
          -- allows you to switch between elements.
          text (show <$> counter)
        -- `Deku.Pursx` contains the `~~` operator, which allows you to
        -- construct typesafe Deku using plain old html.
        , (Proxy :: _ "<p>Now you're a Deku ~adj~</p>") ~~
            { adj: text
                (counter <#> mod 2 >>> eq 0 >>> if _ then "newb" else "master")
            }
        ]
```

So, in summary, ignore the voluminous number of modules in Deku (which makes browsing Pursuit difficult) and focus on the modules used in the example above, namely:

- [`Deku.Toplevel`](https://pursuit.purescript.org/packages/purescript-deku/docs/Deku.Toplevel)
- [`Deku.Core`](https://pursuit.purescript.org/packages/purescript-deku/docs/Deku.Core)
- [`Deku.Do`](https://pursuit.purescript.org/packages/purescript-deku/docs/Deku.Do)
- [`Deku.Hooks`](https://pursuit.purescript.org/packages/purescript-deku/docs/Deku.Hooks)
- [`Deku.DOM`](https://pursuit.purescript.org/packages/purescript-deku/docs/Deku.DOM)
- [`Deku.Listeners`](https://pursuit.purescript.org/packages/purescript-deku/docs/Deku.Listeners)
- [`Deku.Attributes`](https://pursuit.purescript.org/packages/purescript-deku/docs/Deku.Attributes)
- [`Deku.CSS`](https://pursuit.purescript.org/packages/purescript-deku/docs/Deku.CSS)
- [`Deku.Attribute`](https://pursuit.purescript.org/packages/purescript-deku/docs/Deku.Attribute)
- [`Deku.Control`](https://pursuit.purescript.org/packages/purescript-deku/docs/Deku.Control)
- [`Deku.Pursx`](https://pursuit.purescript.org/packages/purescript-deku/docs/Deku.Pursx)


There are a few more modules to be aware of for advanced usage:

- [`Deku.Lifecycle`](https://pursuit.purescript.org/packages/purescript-deku/docs/Deku.Lifecycle) contains methods for arbitrary side effects to run when the Deku Nuts mount and dismount from the DOM.
- [`Deku.Pursx.Anonymous`](https://pursuit.purescript.org/packages/purescript-deku/docs/Deku.Pursx.Anonymous) contains an experimental `pursx` syntax that could theoretically be made better by Visible Type Applications. As that feature develops, if the syntax becomes ergonomic, it may supersede the current `pursx` syntax.
- [`Deku.Interpret`](https://pursuit.purescript.org/packages/purescript-deku/docs/Deku.Interpret) is for folks that wish to build a custom Deku backend. Deku currently supports Single-page applications (the default), static site rendering, and hydrated static site rendering.

Deku is a small codebase. All of the heavy lifting is done via primitives from [`purescript-hyrule`](https://github.com/mikesol/purescript-hyrule), the documentation of which is also on [Pursuit](https://pursuit.purescript.org/packages/purescript-hyrule).

## Why another web framework?

Deku aims to be:

- **fast**: it's up to 2x faster than Halogen for a simple Todo MVC app.
- **small**: the average Deku program tends to be fewer lines of code than its React or Halogen counterparts.
- **ssr-friendly**: Deku has out-of-the-box server-side rendering capabilities. 

## What does Deku mean?

Deku is short for "DOMs Emitted as Kan-extended Universals." It is also the tree of Zelda lore and is a Japanese diminutive for a dullard or simpleton.
