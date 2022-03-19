let conf = ./spago.dhall

in      conf
    //  { sources = conf.sources # [ "examples/**/*.purs" ]
        , dependencies =
              conf.dependencies
            # [ "halogen"
              , "arrays"
              , "arraybuffer"
              , "console"
              , "halogen-subscriptions"
              , "heterogeneous"
              , "nonempty"
              , "identity"
              , "nonempty"
              , "stringutils"
              , "transformers"
              , "uint"
              , "halogen-storybook"
              , "media-types"
              , "web-file"
              , "web-html"
              , "exceptions"
              , "profunctor-lenses"
              ]
        }
