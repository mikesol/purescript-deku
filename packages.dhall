let upstream =
      https://github.com/purescript/package-sets/releases/download/psc-0.15.2-20220624/packages.dhall
        sha256:08989ed9f53e381f879f1b7012ad7684b1ed64d7164c4ad75e306d3210a46c92

let overrides =
      { bolson =
        { dependencies = [ "prelude" ]
        , repo = "https://github.com/mikesol/purescript-bolson.git"
        , version = "give-new-parent"
        }
      , hyrule =
        { dependencies =
          [ "monoid-extras", "web-uievents", "js-timers", "unsafe-reference" ]
        , repo = "https://github.com/mikesol/purescript-hyrule.git"
        , version = "master"
        }
      , halogen-hooks =
        { dependencies =
          [ "aff"
          , "arrays"
          , "bifunctors"
          , "effect"
          , "exceptions"
          , "foldable-traversable"
          , "foreign-object"
          , "free"
          , "freeap"
          , "halogen"
          , "halogen-subscriptions"
          , "maybe"
          , "newtype"
          , "ordered-collections"
          , "parallel"
          , "partial"
          , "prelude"
          , "refs"
          , "tailrec"
          , "transformers"
          , "tuples"
          , "unsafe-coerce"
          , "unsafe-reference"
          , "web-dom"
          , "web-html"
          ]
        , repo = "https://github.com/thomashoneyman/purescript-halogen-hooks"
        , version = "v0.6.1"
        }
      }

in  upstream // overrides
