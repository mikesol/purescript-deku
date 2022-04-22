let conf = ./spago.dhall

in      conf
    //  { sources = conf.sources # [ "examples/**/*.purs" ]
        , dependencies =
              conf.dependencies
            # [ "web-html"
              , "filterable"
              , "affjax"
              , "either"
              , "integers"
              , "aff"
              , "argonaut-core"
              , "http-methods"
              , "maybe"
              ]
        }
