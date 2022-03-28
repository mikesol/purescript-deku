let conf = ../spago.dhall
in conf //
  { dependencies =
      conf.dependencies #
        [ "aff-promise"
        , "avar"
        , "argonaut-codecs"
        , "argonaut-core"
        , "either"
        , "console"
        , "halogen"
        , "halogen-hooks"
        , "filterable"
        , "integers"
        , "node-buffer"
        , "node-fs"
        , "node-path"
        , "nullable"
        , "spec"
        , "strings"
        , "random"
        ,  "aff","halogen-subscriptions"
,"exceptions"
, "partial"
, "tailrec"
, "web-html"
        ]
  , sources =
      conf.sources #
        [ "test/**/*.purs"
        ]
  }
