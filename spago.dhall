{ name = "deku"
, dependencies =
  [ "arrays"
  , "bolson"
  , "control"
  , "effect"
  , "fast-vect"
  , "filterable"
  , "foldable-traversable"
  , "foreign-object"
  , "heterogeneous"
  , "hyrule"
  , "maybe"
  , "monoid-extras"
  , "newtype"
  , "ordered-collections"
  , "prelude"
  , "profunctor"
  , "quickcheck"
  , "record"
  , "refs"
  , "safe-coerce"
  , "st"
  , "strings"
  , "transformers"
  , "tuples"
  , "unsafe-coerce"
  , "web-dom"
  , "web-events"
  , "web-html"
  ]
, license = "Apache-2.0"
, packages = ./packages.dhall
, repository = "https://github.com/mikesol/purescript-deku"
, sources = [ "src/**/*.purs" ]
}
