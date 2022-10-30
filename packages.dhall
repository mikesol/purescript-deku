let upstream =
      https://github.com/purescript/package-sets/releases/download/psc-0.15.4-20221018/packages.dhall
        sha256:b1db2e4a17260ace8d17858602f8c56f460982d6e404818d7f6cb9f053324bb1

let overrides =
      { bolson =
        { dependencies = [ "prelude" ]
        , repo = "https://github.com/mikesol/purescript-bolson.git"
        , version = "v0.3.1"
        }
      , hyrule =
        { dependencies =
          [ "monoid-extras", "web-uievents", "js-timers", "unsafe-reference" ]
        , repo = "https://github.com/mikesol/purescript-hyrule.git"
        , version = "v2.3.2"
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

