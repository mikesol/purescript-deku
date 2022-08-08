let upstream =
      https://github.com/purescript/package-sets/releases/download/psc-0.15.4-20220805/packages.dhall
        sha256:c80e241af3ba62fc42284b9bc26b4c9bd4525eebe4ab0e9198c9bbeac102f656

let overrides =
      { bolson =
        { dependencies = [ "prelude" ]
        , repo = "https://github.com/mikesol/purescript-bolson.git"
        , version = "main"
        }
      , mermaid =
        { dependencies =
          [ "effect"
          , "free"
          , "maybe"
          , "mmorph"
          , "prelude"
          , "st"
          , "tailrec"
          , "transformers"
          ]
        , repo = "https://github.com/purefunctor/purescript-mermaid.git"
        , version = "main"
        }
      }

in  upstream // overrides
